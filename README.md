## Docker Package Downloader Script

This script automates the process of downloading Docker packages for various distributions and architectures.

### Table of Contents

- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Dependencies](#dependencies)
- [Limitations](#limitations)
- [Contributing](#contributing)

### Prerequisites

- Bash shell
- `curl` command-line tool
- Root privileges (to install Docker packages)

### Usage

To check if your distribution and architecture are supported, simply run the script without any arguments and it will display the downloads link.

- File Execution Permission: First, ensure that the script file has the correct execution permission. You can activate the file's execution permission using the chmod command. For example, if your script is saved at `/path/to/your_script.sh`, you can enable the file's execution permission with the following command:
```bash
# chmod +x download-docker.sh
```
- Running the Script: After confirming that the correct execution permission exists, you can run the script using the ./ prefix. For instance:
```bash
# ./download-docker.sh
```
- Using Arguments: Your script uses the -d argument to initiate the download process. Therefore, to download the packages, you need to add this argument to the script execution command:
```bash
# ./download-docker.sh -d
```

### Dependencies

- `curl`: Used to fetch the list of available Docker packages.

### Limitations

- This script currently supports Debian-based distributions (`DISTRIB_ID`) and their codenames (`DISTRIB_CODENAME`). 
- It only downloads the latest version of each Docker component listed in the `TYPES` array.

### Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Developer: This script was developed by [Rizky Zulkarnaen](https://medium.com/ther12k/offline-installation-of-docker-on-ubuntu-a-step-by-step-guide-3afce826b4be "Rizky Zulkarnaen") with slight modification by Mojtabco. For tips or suggestions, please contact him or raise an issue on the GitHub repository..

For access to the source code and reporting issues, visit the GitHub Repository: https://github.com/mojtabco/docker-package-download


