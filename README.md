# Google Chrome Installer / Updater

## Motivation

I've experienced multiple instances where Google Chrome fails to upgrade on openSUSE to the latest version using the built-in update process. 

In these situations, my workaround has been to uninstall Chrome and then reinstall it using the latest RPM.

## Usage

The script is straightforward and essentially automates the manual process: it checks if Chrome is installed on your system; if it is, the script will remove and reinstall it using the latest version, and if not, it will simply install Chrome.

Executing this script only makes sense if you:

- want to upgrade Google Chrome, or
- want to have it installed on your system if it was not


Please note that you must have `root` privileges for this script to run properly.



### Sample run on a system without Google Chrome installed

The script will automatically import the GPG key for Google's repository.

```
# ./gci.sh 

Google Chrome Installer / Upgrader

by martinm@rsysadmin.com
==================================

-> Silently downloading the latest stable Google Chrome...
-> Checking if a previous version of Google Chrome is installed...
--> No previous version of Google Chrome found.
--> I will install the latest stable from scratch.
Loading repository data...
Reading installed packages...
Resolving package dependencies...

The following NEW package is going to be installed:
  google-chrome-stable

1 new package to install.
Overall download size: 105.7 MiB. Already cached: 0 B. After the operation, additional 330.4 MiB will be used.

Backend:  classic_rpmtrans
Continue? [y/n/v/...? shows all options] (y): y
Retrieving: google-chrome-stable-125.0.6422.112-1.x86_64 (Plain RPM files cache)                               (1/1), 105.7 MiB    
google-chrome-stable_current_x86_64.rpm:
    Header V4 RSA/SHA512 Signature, key ID e88979fb9b30acf2: NOKEY
    V4 RSA/SHA512 Signature, key ID e88979fb9b30acf2: NOKEY

warning: /var/tmp/zypp.DCVWZN/zypper/_tmpRPMcache_/%CLI%/google-chrome-stable_current_x86_64.rpm: Header V4 RSA/SHA512 Signature, key ID 9b30acf2: NOKEY
Looking for gpg key ID 9B30ACF2 in cache /var/cache/zypp/pubkeys.

Automatically importing the following key:

  Repository:       Plain RPM files cache
  Key Fingerprint:  EB4C 1BFD 4F04 2F6D DDCC EC91 7721 F63B D38B 4796
  Key Name:         Google Inc. (Linux Packages Signing Authority) <linux-packages-keymaster@google.com>
  Key Algorithm:    RSA 4096
  Key Created:      Tue Apr 12 07:51:15 2016
  Key Expires:      (does not expire)
  Subkey:           4EB27DB2A3B88B8B 2021-10-26 [expires: 2024-10-25]
  Subkey:           E88979FB9B30ACF2 2023-02-15 [expires: 2026-02-14]
  Subkey:           32EE5355A6BC6E42 2024-01-30 [expires: 2027-01-29]
  Rpm Name:         gpg-pubkey-d38b4796-570c8cd3



    Note: A GPG pubkey is clearly identified by its fingerprint. Do not rely on the key's name. If
    you are not sure whether the presented key is authentic, ask the repository provider or check
    their web site. Many providers maintain a web page showing the fingerprints of the GPG keys they
    are using.

Checking for file conflicts: ................................................................................................[done]
update-alternatives: using /usr/bin/google-chrome-stable to provide /usr/bin/google-chrome (google-chrome) in auto mode
(1/1) Installing: google-chrome-stable-125.0.6422.112-1.x86_64 ..............................................................[done]
Running post-transaction scripts ............................................................................................[done]

-> Cleaning up...

-> All set.

#
```

### Sample run on a system with Google Chrome installed (a.k.a. upgrade process)

```
# ./gci.sh 

Google Chrome Installer / Upgrader

by martinm@rsysadmin.com
==================================

-> Silently downloading the latest stable Google Chrome...
-> Checking if a previous version of Google Chrome is installed...
--> Found older instance of Google Chrome.
--> It will be removed and the latest stable will be installed.
Reading installed packages...
Resolving package dependencies...

The following package is going to be REMOVED:
  google-chrome-stable

1 package to remove.
After the operation, 330.4 MiB will be freed.

Backend:  classic_rpmtrans
Continue? [y/n/v/...? shows all options] (y): y
(1/1) Removing: google-chrome-stable-125.0.6422.112-1.x86_64 ................................................................[done]
Running post-transaction scripts ............................................................................................[done]
 
Loading repository data...
Reading installed packages...
Resolving package dependencies...

The following NEW package is going to be installed:
  google-chrome-stable

1 new package to install.
Overall download size: 105.7 MiB. Already cached: 0 B. After the operation, additional 330.4 MiB will be used.

Backend:  classic_rpmtrans
Continue? [y/n/v/...? shows all options] (y): y
Retrieving: google-chrome-stable-125.0.6422.112-1.x86_64 (Plain RPM files cache)                               (1/1), 105.7 MiB    

Checking for file conflicts: ................................................................................................[done]
update-alternatives: using /usr/bin/google-chrome-stable to provide /usr/bin/google-chrome (google-chrome) in auto mode
(1/1) Installing: google-chrome-stable-125.0.6422.112-1.x86_64 ..............................................................[done]
Running post-transaction scripts ............................................................................................[done]

-> Cleaning up...

-> All set.

# 
```

## Bugs and improvements

For bugs: please, raise an issue.

For improvements: please, raise a PR with your proposed changes


## Disclaimer

This script is provided to the openSUSE Community on an "AS IS" basis. The author is not responsible for any damages resulting from its use or misuse.

