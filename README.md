# yayun-project-2-Bash
[![Bash application test with Github Actions using devcontainers](https://github.com/nogibjj/yayun-project-2-Bash/actions/workflows/main.yml/badge.svg)](https://github.com/nogibjj/yayun-project-2-Bash/actions/workflows/main.yml) 
# Project outline
This project aims to categorize data of patients with their risk score for getting atherosclerotic cardiovascular disease(ASCVD), so that if in real cases, health professionals can follow up patients regularly based on their risks of getting ASCD.
![alt text](https://github.com/nogibjj/yayun-project-2-Bash/blob/main/Blank%20board%20(1).png)

# Project files
## Configuration
* Dockerfile
* ./devcontainer/devontainer: build a image based on the Dockerfile, create and activate a virtual environment by adding these steps in to ```~/.bashrc``` file, and install pacakges with ```make install```
* Makefile: Compiling and configuration for the codespaces.
* requirements.txt: required packages.
## Alias 
* project_alias.sh: Type ```start_my_project``` to activate alias in project_alias.sh.
## Main analysis file
* info.sh: scriptis to get information of data.
* truncate.sh: truncate data into smaller files.
* categorize.sh: categorize data based on patients risks.

# Project flow
1. (Automatically) Devcontainter files will use Dockerfile, Makefile, and requirements.txt to configure the workspace.
2. Initiate project: type ```start_project``` on command line to activate aliases
3. Download data through Kaggle API: type ```download``` on command line.
4. Look at info for the dataset: type ```info``` on command line and enter the downloaded file name.
5. Truncate data: type ```truncate``` on command line and enter the file name. It will tell you the file's size and user can type "yes" or "no" to decide whether to truncate the data. Each truncated file contains 300 or less lines and will be in a folder named "files_for_analysis."
6. Categorize data: type ```categorize``` on command line and enter the folder containing files needed to be analyze, so type ```files_for_analysis```. Then, data will be categorized in to three files based on risk scores the data: high medium and low _risk.csv inside the folder ./patient_by_risk.



# Data Source