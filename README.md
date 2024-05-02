# HackersForYou Web Recon Script

This script is designed for performing reconnaissance on a target website, gathering subdomains, checking for live subdomains, and running Nmap scans on the live subdomains.

## Prerequisites

Before running the script, ensure you have the following tools installed:

- Python 3
- `pip` package manager
- `git` (optional, for cloning the repository)

## Installation

1. Clone the repository:

    ```
    git clone https://github.com/yourusername/hackersforyou-web-recon.git
    ```

2. Navigate to the project directory:

    ```
    cd hackersforyou-web-recon
    ```

3. Install the required Python packages:

    ```
    pip3 install -r requirements.txt
    ```

## Usage

Run the script by executing the following command: 

  ## ./project.sh





Follow the prompts to enter the target URL. The script will then gather subdomains, check for live subdomains, and perform Nmap scans on the live subdomains.

## Output

The script will create a directory named after the target URL, containing the following directories:

- `subdomains`: Contains lists of discovered subdomains.
- `live_subdomains`: Contains lists of live subdomains.
- `eyewitness_screenshots`: (Optional) Contains screenshots of web pages.
- `secret_js_links`: (Optional) Contains links to JavaScript files.
- `nmap_scans`: Contains Nmap scan results.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Disclaimer

This script is provided for educational purposes only. Users are solely responsible for any actions performed using this script.

