using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;
using Ookii.Dialogs.Wpf;
using System.Text.RegularExpressions;
using System.Security.Cryptography;

namespace KlpqMusicConfigurator
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        public string GetMD5(string filename)
        {
            using (var md5 = MD5.Create())
            {
                using (var stream = File.OpenRead(filename))
                {
                    return BitConverter.ToString(md5.ComputeHash(stream)).Replace("-", "").ToLower();
                }
            }
        }

        public async Task<string> GenerateConfig()
        {
            richTextBox1.Text = "";

            string finalConfig = "class CfgPatches {\n    class klpq_musicRadio_configs {\n        units[] = {};\n        weapons[] = {};\n        requiredVersion = 1;\n        requiredAddons[] = {};\n    };\n};";

            finalConfig += "\n\n";

            string cfgMusicConfig = "";
            string cfgSoundsConfig = "";

            progressBar1.Minimum = 0;
            progressBar1.Maximum = listView1.Items.Count;
            progressBar1.Value = 0;
            progressBar1.Step = 1;

            foreach (ListViewItem X in listView1.Items)
            {
                string fullPath = path_textBox.Text + Path.DirectorySeparatorChar + X.Text;
                string className = "klpq_musicRadio_" + await Task.Run(() => GetMD5(fullPath));
                string localPath = Path.GetFileName(path_textBox.Text) + Path.DirectorySeparatorChar + X.Text;
                string theme = "";
                int duration = 0;
                string artist = "";
                string title = "";

                using (var vorbisStream = await Task.Run(() => new NAudio.Vorbis.VorbisWaveReader(fullPath)))
                {
                    duration = (int)Math.Round(vorbisStream.TotalTime.TotalSeconds);

                    foreach (string A in vorbisStream.Comments)
                    {
                        if (A.ToLower().StartsWith("artist="))
                            artist = A.Split('=')[1];

                        if (A.ToLower().StartsWith("title="))
                            title = A.Split('=')[1];
                    }
                }

                artist = Regex.Replace(artist, "[^0-9a-zA-Z \\-()',.]", "_");
                title = Regex.Replace(title, "[^0-9a-zA-Z \\-()',.]", "_");

                if (X.Text.Split(Path.DirectorySeparatorChar).Length > 1)
                {
                    theme = "\n        theme = \"" + X.Text.Split(Path.DirectorySeparatorChar)[0] + "\";";
                }

                cfgMusicConfig += "\n    class " + className + " {\n        sound[] = {\"" + localPath + "\", db+3, 1};\n        tag = \"klpq_musicRadio\";" + theme + "\n        duration = " + duration + ";\n        artist = \"" + artist + "\";\n        title = \"" + title + "\";\n    };";

                cfgSoundsConfig += "\n    class " + className + " {\n        sound[] = {\"" + localPath + "\", db+6, 1, 100};\n        titles[] = {};\n    };";
                cfgSoundsConfig += "\n    class " + className + "_loud {\n        sound[] = {\"" + localPath + "\", db+12, 1, 500};\n        titles[] = {};\n    };";

                progressBar1.PerformStep();
            }

            finalConfig += "class CfgMusic {\n    tracks[] = {};\n";

            finalConfig += cfgMusicConfig;

            finalConfig += "\n};\n\n";

            finalConfig += "class CfgSounds {\n    tracks[] = {};\n";

            finalConfig += cfgSoundsConfig;

            finalConfig += "\n};\n";

            return finalConfig;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            VistaFolderBrowserDialog chosenFolder = new VistaFolderBrowserDialog();
            chosenFolder.Description = "Select folder...";

            if (chosenFolder.ShowDialog().Value)
            {
                path_textBox.Text = chosenFolder.SelectedPath;

                List<string> folder_filesArray = Directory.GetFiles(path_textBox.Text, "*.ogg", SearchOption.AllDirectories).Select(x => x.Replace(path_textBox.Text + "\\", "")).ToList();

                listView1.Items.Clear();

                foreach (string X in folder_filesArray)
                {
                    listView1.Items.Add(X);
                }
            }
        }

        private async void button2_Click(object sender, EventArgs e)
        {
            string finalConfig = await GenerateConfig();

            richTextBox1.Text = finalConfig;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (richTextBox1.Text.Length != 0)
                Clipboard.SetText(richTextBox1.Text);
        }
    }
}
