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

namespace KlpqMusicConfigurator
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
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

        private void button2_Click(object sender, EventArgs e)
        {
            string finalConfig = "class CfgPatches {\n    class klpq_musicRadio_files {\n        units[] = {};\n        weapons[] = {};\n        requiredVersion = 1;\n        requiredAddons[] = {};\n    };\n};";

            finalConfig += "\n\n";

            finalConfig += "class CfgMusic {\n    tracks[] = {};\n";

            foreach (ListViewItem X in listView1.Items)
            {
                string className = "klpq_musicRadio_" + X.Index;
                string path = Path.GetFileName(path_textBox.Text) + Path.DirectorySeparatorChar + X.Text;
                string theme = "";
                int duration = 0;
                string artist = "";
                string title = "";

                using (var vorbisStream = new NAudio.Vorbis.VorbisWaveReader(path_textBox.Text + "\\" + X.Text))
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

                finalConfig += "\n    class " + className + " {\n        sound[] = {\"" + path + "\", db+3, 1};\n        tag = \"klpq_musicRadio\";" + theme + "\n        duration = " + duration + ";\n        artist = \"" + artist + "\";\n        title = \"" + title + "\";\n    };";
            }

            finalConfig += "\n};\n\n";

            finalConfig += "class CfgSounds {\n    tracks[] = {};\n";

            foreach (ListViewItem X in listView1.Items)
            {
                string className = "klpq_musicRadio_" + X.Index;
                string path = Path.GetFileName(path_textBox.Text) + Path.DirectorySeparatorChar + X.Text;

                finalConfig += "\n    class " + className + " {\n        sound[] = {\"" + path + "\", db+6, 1, 50};\n        titles[] = {};\n    };";
                finalConfig += "\n    class " + className + "_loud {\n        sound[] = {\"" + path + "\", db+12, 1, 250};\n        titles[] = {};\n    };";
            }

            finalConfig += "\n};\n";

            richTextBox1.Text = finalConfig;

            File.WriteAllText(path_textBox.Text + Path.DirectorySeparatorChar + "config.cpp", finalConfig);

            MessageBox.Show("Config saved to " + path_textBox.Text + Path.DirectorySeparatorChar + "config.cpp");
        }
    }
}
