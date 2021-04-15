# <ins>AWS Notes</ins>

## <ins>IAM Users and ARNs</ins>

- Humans
- Applications
- Service Accounts

- Identities IAM User, Groups Roles
- Polices get attached to Identities

### Deny Allow Deny

Managed Policies (Low management overhead)

- AWS Managed Policies
- Customer Manager Policies

Inline Policy (Exceptions to normal access rights) app to one or each user slow

IAM Users are an identity used for anything requiring long-term AWS access  e.g.

Humans
Applications
Service Accounts

+ <b>P</b> (Principle)
+ <b>A</b> (Action)
+ <b>R</b> (Resource)
+ <b>C</b> (Condition)

- Principle makes requests with IAM to interact with resources
- Principle proves to IAM that it's an identity it needs to be
    - Authentication is either done via username and password or password keys
    - Once completed the principle is known as an authenticated identity

- 5000 Iam Users per account (exam)
- Iam user can be a member of up to 10 groups
- IAM Roles and Identity Federation fix for above 

AWS Well-Architected Framework, Cost Optimization

### <ins>DENY ALLOW DENY</ins>

### AIM Roles

- Roles are identities that exist within AWS account along with Users
- IAM User Single Principle 
- IAM Roles Multiple Principle (inside outside AWS account)
- More 5000 Principles it becomes a candidate for IAM Role
- IAM Roles are assumed .. you become that role 
- Permissions polices.
    - Trust Controls which identity can assume that role 
        - Trust policy can reference identities in the same account IAM Account, IAM Roles
        - Temporary Security Credentials are made available to the account that assumed the role
    - sts:AssumeRole

When to choose an IAM Role

AWS Lambda

Lambda Execution Roles
Trust Policy  - Lambda - Permissions Policy

Cross Account Access

## <ins>AWS Organisations</ins>

- Standard AWS Account you create AWS Organisation ( Management Account) Master Account
- Invite other existing standard AWS Accounts, they. Need approve invite they become (Member Accounts)
- Organisational Root , container can contain, OUs 
- Consolidated Billing , meter accounts pass there billing to Management Account of the organisation Payer account, 
- Consolidation of reservations and volume discounts
- SCP Service Control Policy
- Create new accounts within organisations, there isn’t an invite process.
- Role switch 
- OrganizationAccountAccessRole

### Service Control Policies

- SCP can be attached to ROOT Container or can be attached to one or more OU
- The Management account is never effected by SCP.
- SCP are account permissions boundaries, they limit what an account can do including the root user
- SCP don’t grant any Permissions are just a boundary they define a limit of what is and isn’t allowed within an account

### Cloudwatch Logs

- Public Service usable from AWS or on premises
- Store, Monitor and access logging data
- Can Generate metric based on logs
- Regional Service
- Log events are stored with log streams.. log streams are log events from the same source
- Log Groups are container for multiple logs streams for the same type of logging
- Log Group also a place where it store configuration settings
- Log Groups are where metric filters are defined.

### Cloud Trail

- Logs API Instances
- Cloud trail stores the last 90day of events in Event History, Enabled by default at no cost
- To customise the service .. Create 1 or more trails
- Management Events and Data Events
- Management events Control Plane operations
- Data events not logged at default
- A trail logs events for the AWS region its created in
- All Region Trail and its got Global services turned on
- A trail can store event in a definable s3 bucket, logs can be stored indefinitely
- Cloud trail and put data into s3 or cloud watch logs, metric filter.
- Organisational Trail. Managing Muti account easier

Management events, Data events, Insights events


- Enabled by default but only <ins>90 day history</ins> is enabled by default no s3
- Default is to store management events only by default
- IAM, STS, Cloud front => Global Service Events gets logged to us-east-1
- A trail needs to be enabled to capture the data
- Cloud Trail is not realtime there is a delay <ins>(15mins delay)</ins>

## <ins>S3</ins>

- S3 is Private by default
- S3 can store objects up to <ins>5TB</ins> in size
- S3 default number of buckets is <ins>100</ins>
- S3 bucket is a form of resource policy
- Like identity policies but attached to a bucket
- Resource polices you controlling who can access that resource
- Bucket polices can be used to grant anonymous access

### Object Versioning and MFA Delete

- Bucket Versioning starts on disabled - enable it you can’t disable it you can just suspend it.
- Disabled
    - Enabled
    - Suspended
    - Enabled again
KEY = keynote
ID = 0 when object versioning is disabled.

- MFA Delete (MFA is required to change bucket versioning state)
- MFA is required to delete versions of object
- S3 always picks the latest version when object versioning is switched on
- When an object is deleted with object versioning switched on S3 adds a delete marker object, unless the list versions is switched on you will not see this.

### S3 Performance Opitimization

- Single data stream to s3 - stream fails upload fails - Requires full restart
- Single put upload is <ins>5GB of data</ins>
- Solution multipart upload , data is broken into individual parts
- <ins>Minimum data size for multipart upload is 100MB</ins>
- An upload can be split max part <ins>10,000, 5MB -> 5GB</ins>
- Each part can fail in isolation and be restarted.
- Transfer rate = speed of the parts

### s3 accelerated transfer

Once created created endpoint, uses edge network

## <ins>Encryption</ins>

### KMS

- Regional and Public Service
- Keys are locked inside KMS, <ins>keys never leave KMS</ins>
- <ins>FIPS 140-2 L2 (Exam Pointer)</ins>
- CMK Customer Master Keys (logical KeyID, Creation Data, Policy, Description, State)
- Backup by physical key material 
- CMK only can be used for up to <ins>4kb limit</ins>
    - User creates CMK and a logical Customer Master Key is created, (Think container)
    - KMS Takes users CMK and encrypts it into KMS before its stored on disk.
    - User makes call to KMS giving CMK key to use and some data in encrypt
    - KMS decrypts the stored CMK and uses that key to decrypt data the user has sent

### DEK ( Data Encryption Key)

- GenerateDataKey uses CMK to generate data larger than 4Kb in size.
- DEK is linked in certain CMK.
- KMS does not store the DEK
- It provides it to you then it discards it

### DEK (Data encryption key) Process
  
- Take plaintext version of key
- encrypt plaintext that creates cipher text is created with CMK
- Then you discard the plaintext key
- Store the encrypted data and encrypted data encryption key


### S3 Encryption

- Buckets aren’t encrypted objects are
- Clientside encryption
- Severside encryption
- Header to enable s3 encryption x-amz-server-side-encryption
    - <ins>AES256 -s3 -SSE-S3 (cmk provided by aws)</ins>
    - <ins>Aws:kms -s3 KMS (fine grained keycontrol)</ins>
    - <ins>Default = Bucket Default</ins>


## <ins>S3 Storage Classes</ins>

### S3 Standard

- S3 Standard <ins>(across at least 3 AZs)</ins> <ins>11'9s durability</ins>
- When objects are stored a HTTP/1.1 200 OK response is provided. by s3 API Endpoint.
- You are billed for data stored a $5 per GB Charge for transfer
- OUT (IN is free) and a price per <ins>1,000 requests</ins>
- When s3 is requested it’s available within milliseconds and objects. Can be made publicly available
- Should be used for frequently accessed data which is important and non replaceable. (Exam note)

### S3 Standard IA 
- retrieval charge, change per object <ins>128Kb per object</ins>
- Should be used for long-lived data  which is important but where access is infrequent (Exam Note)


### S3 One Zone IA 
- Should be used for long-lived data which is <ins>NON-CRITICAL & REPLACEABLE</ins> and where access is Infrequent

### S3 Glacier

- Cost effective 1.5th of the cost of s3 standard
- Objects stored in the glacier class are cold objects, and they aren't ready for use.
- to get access to glacier objects you need to perfrom a retrieval process, you pay for the retriveal process 
- Glacier has a first byte latency  = minutes or hours 
- Glacier Retrival Types: 
    - <ins>Expedited (1 - 5 mins)</ins>
    - <ins>Standard (3 - 5 hours)</ins>
    - <ins>Bulk (5 - 12 hours)</ins>
The faster the more expensive

- Archival data where frequent or realtime access isn't needed minutes-hours of retrieval.

### S3 Glacier Deep Archive

- Cheaper than Glacier
- Data in Frozen State
- Objects stored in the glacier class are cold objects, and they aren't ready for use
- Glacier Deep Archive Retrival Types:
    - <ins>Standard (12 hours)</ins>
    - <ins>Bulk (48 Hours)</ins>
First byte latency = hours or days

- Archival data that rarely if ever needs to be accesed 
- Used for legal and Regulation data storage

### S3 Intelligent Tiering

- S3 Intelligent Tiering has <ins>4 Tiers</ins>

- S3 Intelligent Tiering has a monitoring and automation cost per 1000 objects, 
- The frequent access tier costs the same as s3 standard
- The Infrequent Access tier costs the same as Standard-IA

- Frequent Access  
- after <ins>30 days</ins> if not accesed the object will be moved to the Infrequent Access tier.
    - Infrequent Access
     - Archive
       - Deep Archive


- S3 Intelligent Tiering shoud be used for long-lived data with changing or unknown data patterns

### S3 Lifecycle Configuration

- S3 Lifecycle is a set of rules that you apply to a bucket. Rules can apply to buckets or groups of objects
- Limit the scope of the lifecycle rule to specific prefixes and tags
- Transition Actions ( Move from one tier to another ) <ins>(current and previous versions)</ins>
- Expiration Actions ( Delete whatever objects need to deleted in a cetain time ) can be used as cost optimization )
- Transition smaller objects can cost more (minium size)
- <ins>30 day minium</ins> where an object need to stay on s3 standard before tranisition to lower storage tiers
- A single rule cannot transition to Standard-IA or OneZone-IA then to either glacier type within <ins>30 days</ins>

### S3 Replication

- <ins>Cross-Region Replication (CRR) </ins>Allows the replication from the source bucket to destination bucket in diffrent aws regions
- <ins>Same-Region Replication (SRR) </ins>Allows the replication from source to destination in the same AWS regions
- Replication application is applied from the <ins>source bucket</ins>
- IAM role defined on source bucket, and is used to allow access to destination bucket
- You can replicate all objects or a subset of objects, by creating a <ins>rule filter</ins>
- You can also select which storage class the destination will use , <ins>default to use the same as source</ins>
- You can akso define the ownership, <ins>the default is the source account</ins>
- Replication Time Control (RTC) adds a <ins>15min</ins> SLA onto time it takes to sync.

- Replication is nor retoactive & versioning needs to be on.
- if you enable replication on a bucket that already has objects in it, the objects that were in the bucket before you switched on replicaton will not bereplicated.
- <ins>Both the source and destination bucket needs to have versioning enabled, it is a requirement</ins>.
- One-way replicaton only <ins>SOURCE > DESTINATION</ins>.
- Replication is able to handle objects that are Uncrypted, SSE-S3 & SSE-KMS (with extra config) NOT SSE-C as S3 replication is not in control of the keys
- Source bucket owner needs permisions to objects
- NO system events, glacier or glacier deep archive can't be replicated.
- Deletes are not replicated. (Unless Selected)

<ins>Why use replication</ins>

- SRR - Log Aggregation
- SRR - Prod and Test Sync
- SRR - Resilince with strict sovereignty
- CRR - Global Resilience Improvments (backups in differnt regions)
- CRR - Latency Reduction ( Better Perfromance )

### S3 Presigned URLs

- Presigned URLSs are a feature of s3 that allows the system to generate a URL with aceess permissions encoded into it, for a spefic bucket and object
- It is only valid for a certian period of time.
- It uses the creators acces rights as an identity to access the bucket and objects.

- You can create a presigned URL for an object you have no access to.
- When using the URL, the permissons match the identity which generated it.
- Access deined could mean that the generating ID never had access or its time has expired.
- Don't generate a presigned url with a role, URL stops working when temporary credentials expire.
- Presigned url is linked to the identy that generated it.
- Can create a presigned url for an object that doesn't exist.

```bash
aws s3 presign s3://mybucket/file.jpg  -expires-in 180
```

### S3 Select and Glacier Select

- S3 Select and Glacier Select are ways where you can retirive parts of objects. rather than the entire object.
- S3/Glacier allows you to select partial objects using SQL like statements.
- To select parts of the oject, pre-filtered by S3.
- allow the following file formats.
    - CSV
    - JSON
    - Parquet
    - BZIP2 Compression for CSV and JSON
- with S3 Select Filtering occurs on the service the data delivered by S3 is pre-filtered
- Which is to 400% faster and 80% cheaper

### S3 Events

- When enabled a Notifcation is generated when events occur in a bucket
- The notifcations trigger and can deiver to SNS, SQS and Lambda functions.
- Event Driven Processees, automated work flow.
- Objects created (Put, Post, Copy, CompleteMultiPartUpload) complete.
- Object restore, notify when a restore starts or ends.
- Create S3 bucket - <ins>define a Event Notfication config.</ins>
- Event Bridge

### S3 Access Logs

- Enable Logging on source bucket. (S3 delivery group) best efforts process
- acl given on target bucket


## Networking

- VPC minimum /28 (16IP), maxium /16 (65456 IPs)
- VPC Sizing 

### NACLS

- <ins>Stateless</ins> - INIATION and RESPONSE seen as diffrent
- Only Impacts data crossing subnet border
- Can EXPLICITLY ALLOW and DENY
- IPs/Networks, Ports & Protocols - no logcal resources
- NACLS cannot be assigned to AWS only subnets
- Use with Security Groups to add explicit DENY (Bad IPs/Nets)
- One Subnet = One NACL at a time
- Lower rule number will allways be processed first

### Security Groups

- <ins>Stateful</ins> - TRAFFIC and RESPONSE = </ins>Same Rule</ins>
- SGs can filter based on </ins>AWS Logical Resources</ins>
- Resources, other SGs and even themselves
- Implicit Deny and Explicit Allow
- <ins>NO EXPLICIT DENY</ins>

### SGs vs NACL

- NACLS on subnet for any products which don't work with SG's e.g NAT Gateways
- Use NACLS when adding explicit DENY (Bad IP's bd actors)
- SG as default almost everywhere

### NAT and NAT Gateways

## EC2

- EC2 Architecture (AZ Reslient Hardware)
- Relies on AZ Avalibity Zone. EC2 EBS Avalibity Zone cannot cross region or AZ
- Whats ec2 good for ?
    - Traditional OS+Applicaton Compute
    - Long-Running Compute needs
    - Server style applications
    - either burst or steady-state load
    - Monolithic application stacks
    - Migrated application workloads or DR


### Instance Types

- General Purpose 
    - Compute Optimized <ins>Default</ins> Diverse workloads, equal resource ratio
    - Memory Optimmized Processing large in memeory datasets some databas workloads
    - Accelerated Computing Hardware GPU
    - Storage Optimiized - Sequenital and Random IO -scale-out transactional datdabasesm Elastic search, analytics workloads
    - EC2Intance.info website.
    - ec2 instance connect
    - https://ip-ranges.amazonaws.com/ip-ranges.json
    - instance connect cli tool to connect with private address, web is only public instances.

### Storage

- Direct (local) attached Storage on EC2 host
- Network Volumes delivered over the network (EBS)
- Ephermeral Storage - Temporary Storage
- Persistent Permanent storage lives on past the lifetime of the instance
- IO Block size x iops = thoughput

### EBS

- block storage - rwa disk allocations (volume) - can be encrypted using KMS
- instance see block device and create fiel system on device (ext3/4, xfs)
- storage is provisoned in <ins>ONE AZ</ins> (reslisent in that AZ)
- attached to one instance at a time.
- detached and reattached, not lifecycle linked to one instance .. persistent
- snapshot (backup) into S3. Create volume from snapshot to (migrate between AZs)

### Instance Store

- Local on EC2 Host
- Add at launch ONLY
- Lost on instance move, resize or hardware failure
- High performance
- You pay for it anyway - included in instance price
- Instance store volumes are temporary

### Instance store vs EBS

- Persistance EBS (avoid instance store)
- Reslience EBS (avoid instance store)
- Storage isolated from instance lifecycle EBS
- Super high performance needs instance store
- Cost Instance store

- Cheap = ST1 or SC1
- Throughput .. Streaming ST1
- Boot not ST1 or SC1 Mechnical disk use as boot volumes
- GP2/3 up to 16,000 IOPs
- IO1/2 up to 64,0000 IOPS (*256,000) io/block express
- RAID 0 + EBS up to 2600,000 IOPS (io1/2-BE/GP2/3)
- More than 260,000 IOPS - Instance Store

### EBS Snapshots

- Snapshots are incremental volume copies to S3
- The first is a full copy of data on the volume
- Future snaps are incremental
- Volumes can be created(restored) from snapshots
- Snapshots can be copied to another region
- FSR Fast snapshot restore 50 per region set on snap and AZ (FSR costs extra)


### EBS Encryption

- Accounts can be set to encrypt by default - default CMK
- Otherwise choose CMK to use, CMK is used to generate DEK
- each volume uses 1 unique DEK
- Snapshots and future volumes use the same DEK
- Can't change a volume to NOT be encrypted
- OS isn't aware of encryption .. no performance loss

### Network Interfaces Instance IPs and DNS

- Secondary ENI + MAC = Licensing
- Multi-homed (subnets) Managment & data
- Security groups are attached to interfaces ENI's
- OS doesn't see the public IPv4
- IPv4 Public IPs are Dynamic Stop & Start = Change
- Public DNS = Provate IP in VPC, public IP everywhere else

### AMIs

- AMIs are regional ami has unique ID
- AMIs are in one region
- AMi Baking creating an AMI from a configured instance + application
- AMI can only be used for region you are in
- AMI only your account, set it public or add aws accounts to use it.
- AMI Life Cycle
    - Launch
    - Configure
    - Create Image
    - Launch
- AMI snapshots are taken using block device mapping
- AMIs can not be edited
- AMIs can be copied accross aws regions
- AMIs does use EBS snapshots and can incure costs

### Billing Pricing Models

- 3 main models
    - On-Demand
    - Spot
    - Reserved

<u>On-demand</u>


- Instances have an houly rate and you use the instance
- Billedin seconds (60s minimum) of hourly rate
- Defualt Pricing Model
- No lonf term commitments or up from payments
- New or uncertain apppliction requirements
- Short term, spiky or unpredictable workloads that can;t tolerate any disruption

<u>Spot</u>

- A spot price is set by EC2 - based on spare capacity
- You can specity a maximum price you'll pay
- If the spot price goes above your set maximumprice your instaces will be terminated
- Applications that have flexible start and end times
- Apps which can <ins>tolerate failure</ins> and continue later

<u>Reserved Instances</u>

- Up to 75% off vs On0demand for a commitment.
- 1 or 3 years, all Upfront, Partial Upfront, No Upfront.
- Reserved in region, os AZ with capacity reservation
- Scheduled Reservations
- Known steady state usage
- Lowest cost for app which can't handle disruption
- Need reserved capacity


### Instance Status Checks & Auto Recovery

- System reachbility check
    - Loss of Power
    - Loss of network Connectivity
    - Host software issues
    - Host hardware issues

- Instance Status Checks
    - Corrupted file system
    - Incorrect Instance Networking
    - OS Kernel Issues

- Use autorecovery if failed. (only works with EBS not Instance store volumes)
- remember disableApiTermination

### Horizontal vs Vertical Scaling

<u>Vertical Scaling</u>

- each resize requires a reboot - disruption
- Larger instances offen carry a premium cost
- There is an upper cap on performance - instance size
- No application modifcation required.

<u>Horizontal Scalling</u>

- Load Balanacer distrbutes load accross instances
- Sessions
- requires aplicaton support or off-host sessions. peresisnce databases
- No disruption when scalling
- No real limits to scaling 
- Often less expensive 
- More granular

## Instance Metadata

- htp://169.254.169.254 / latest/meta-data
- Environment
 - Networking
 - Authentication
 - User-Data

- Not authenicated or encryted 
- IPv4 public address not visabel within the operatiing system

## Containers and ECS

- EC2 mode EC2 instances as continer engines.
- Fargate mode
- Managed continer cluster
- Container Defintion on where your continer is and what port is exposed
- Task Definition, store the resources
- Task Role, is an IAM Role that a task can assume
- Service Definition is how we define how we want a task to scale.
- Create a Cluster then you del=ploy either tasks or services into that cluster

