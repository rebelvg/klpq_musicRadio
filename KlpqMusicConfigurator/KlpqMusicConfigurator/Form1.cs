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
using System.Net;

namespace KlpqMusicConfigurator
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();

            toolTip1.SetToolTip(checkBox1, "Don't generate artist and title tags. Fallback for situations when there's a bad symbol in tags and config crashes the game on launch.");
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
                string theme = "no_theme";
                int duration = 0;
                string artist = "";
                string title = "";
                int isIgnored = 0;

                using (var vorbisStream = await Task.Run(() => new NAudio.Vorbis.VorbisWaveReader(fullPath)))
                {
                    duration = (int)Math.Round(vorbisStream.TotalTime.TotalSeconds);

                    if (!checkBox1.Checked)
                    {
                        foreach (string A in vorbisStream.Comments)
                        {
                            if (A.ToLower().StartsWith("artist="))
                                artist = A.Split('=')[1];

                            if (A.ToLower().StartsWith("title="))
                                title = A.Split('=')[1];
                        }
                    }
                }

                artist = WebUtility.HtmlEncode(artist);
                title = WebUtility.HtmlEncode(title);

                if (X.Text.Split(Path.DirectorySeparatorChar).Length > 1)
                    theme = X.Text.Split(Path.DirectorySeparatorChar)[0];

                if (listView2.CheckedItems.Cast<ListViewItem>().Select(A => A.Text).Contains(theme))
                    isIgnored = 1;

                cfgMusicConfig += "\n    class " + className + " {\n        sound[] = {\"" + localPath + "\", db+3, 1};\n        tag = \"klpq_musicRadio_v1\";" + "\n        theme = \"" + theme + "\";" + "\n        duration = " + duration + ";\n        artist = \"" + artist + "\";\n        title = \"" + title + "\";\n        klpq_ignoreTrack = " + isIgnored + ";\n    };";

                cfgSoundsConfig += "\n    class " + className + " {\n        sound[] = {\"" + localPath + "\", db+6, 1, 100};\n        titles[] = {};\n    };";

                cfgSoundsConfig += "\n    class " + className + "_vol0 {\n        sound[] = {\"" + localPath + "\", db+0, 1, 100};\n        titles[] = {};\n    };";
                cfgSoundsConfig += "\n    class " + className + "_vol1 {\n        sound[] = {\"" + localPath + "\", db+3, 1, 100};\n        titles[] = {};\n    };";
                cfgSoundsConfig += "\n    class " + className + "_vol2 {\n        sound[] = {\"" + localPath + "\", db+6, 1, 100};\n        titles[] = {};\n    };";

                cfgSoundsConfig += "\n    class " + className + "_loud_vol0 {\n        sound[] = {\"" + localPath + "\", db+0, 1, 500};\n        titles[] = {};\n    };";
                cfgSoundsConfig += "\n    class " + className + "_loud_vol1 {\n        sound[] = {\"" + localPath + "\", db+6, 1, 500};\n        titles[] = {};\n    };";
                cfgSoundsConfig += "\n    class " + className + "_loud_vol2 {\n        sound[] = {\"" + localPath + "\", db+12, 1, 500};\n        titles[] = {};\n    };";

                progressBar1.PerformStep();
            }

            string finalConfig = "class CfgPatches {\n    class klpq_musicRadio_configs_" + (Int32)(DateTime.UtcNow.Subtract(new DateTime(1970, 1, 1))).TotalSeconds + " {\n        units[] = {};\n        weapons[] = {};\n        requiredVersion = 1;\n        requiredAddons[] = {};\n    };\n};";

            finalConfig += "\n\n";

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
                listView2.Items.Clear();

                foreach (string X in folder_filesArray)
                {
                    listView1.Items.Add(X);
                }

                foreach (ListViewItem X in listView1.Items)
                {
                    string theme = "no_theme";


                    if (X.Text.Split(Path.DirectorySeparatorChar).Length > 1)
                        theme = X.Text.Split(Path.DirectorySeparatorChar)[0];

                    if (!listView2.Items.Cast<ListViewItem>().Select(A => A.Text).Contains(theme))
                        listView2.Items.Add(theme);
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
