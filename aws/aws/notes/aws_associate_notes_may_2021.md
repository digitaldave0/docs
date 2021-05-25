 <ins>AWS Notes</ins>
 
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

-
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
- Container Defintion on where your image is and what port is exposed
- Task Definition, applies to the appliocation - Security (Task Role),Containers,Resources
- Task Role, is an IAM Role which the TASK assumes
- Service Definition is how we define how we want a task to scale. (How many copies, HA, Restarts)
- Create a Cluster then you deploy either tasks or services into that cluster
 
### ECS Cluster Types
 
- EC2 mode overhead greater
- Fargate less overhead
- Large Workload - price conscious - EC2 Mode
- Large Workload - overhead conscious - Fargate
- Small / Burst workloads - Fargate
- Batch / Periodic workloads - Fargate
 
### EC2 Bootstraping
 
- Bootstraping allows EC2 Automation
- User Data - Accessed via the meta-data IP
- <ins>http://169.254.169.254/latest/user-data</ins>
- Anything in User Data is executed by the instance OS
- <ins>Only on Launch</ins>
- EC2 dosen't interpret the OS needs to understand the User Data
- Userdata is limited to 16KB in size
- Can be modified when stopped
- Boot-Time-To-Service-Time 
- check cloud-init-output.log to see use userdata set at boot time
 
### Enhanced Bootstraping with CFN-INIT
 
- cfn-init helper script . Simple configuration management system
- Procedural (User data) vs Desired State (cfn-init)
- Provided with directives via Metadata and AWS:Cloudformation::Init on CFN resource
- cfn-signal , creation policy 
 
## EC2 Instance Role 
 
- IAM Role Permisons policy attached to it
- Instance Profile
 
## SSM Parameter Store
 
- Parameter store stores Strings, StringLists, Secure Strings
- Changes to Parameter Store trigger events
- Standard or Advanced upto 1000, Standard no cost
- aws ssm get-parameters --names
- aws ssm get-parameters-by-path --path
- aws ssm get-parameters-by-path --with-decryption
 
## Logging on EC2
 
- Store cloudwatching logging config in SMM parameter Store
- Incure a cost when using advanced.
 
## EC2 Placement Groups
 
- Cluster (PERFORMANCE) Pack instances close together
    - Cluser placement groups belong to a single avalibility zone
    - Run in the same Rack or sometimes the same host, all instances have direct connections to each other
    - Single stream 10Gbs per sec
    - Cannont Span AZ only one AZ
    - Can span VPC Peers but impacts performance
    - Requries a supported instance type
    - Launch all instances at same time for cluster group, but not mandatory
 
- Spread (Reslience) Keep instances seperated
 - 7 instances per AZ
 - Provides the highest level of avability and resilience
 - Each instance is located on differnt rack, by default handled by AWS
 
- Partition (Topology Awareness) groups of instances spread apart
 - More than 7 intsnace per AZ
 - Multipul AZs with in Partition Group 7 per AZ per Region
 - Launch as many istance as you want into each partition.
 - You can decide, you control whoich partition your instances go into
 - Large scale systems, groupings of each instance. HDFS, HBASE, Casandra, Large scale DBs
- Not spported on Decidated Hosts
 
## Dedicated Hosts
 
- AMI Limits RHEL, SUSU Linux and Windows AMIs aren't supported
- Amazon RDS instance are not supported
- Placement Groups are not suppported for Dedicated Hosts.
- Hosts can be shared with other Accounts using RAM.
- Less flexaibility
 
## Enhanced Networking and EBS Optimized
 
- Uses SR-IOV - Nic is virtulization aware
- No Charge available on most EC2 Types
- Higher I/O & Lower Host CPU Usage
- More Bandwidth
- Higher packets per second
- Consistent lower latency




## Route 53
 
- DNS Database (zone file) hosted by route53 (Public Name Servers)
- Accessible for the public internet & VPCs
- Hosted on 4 R53 Name Servers NS specific for the zone
- Resource Records (RR) created within the Hosted Zone
- Externally registed domains can point at R53 Public Zone
 
### Private hosted Zone
 
- A Private Hossted Zone is a public hosted zone which isn't public
- Associated with VPCs, An is only accessible in those VPCs
- Using accounts is supoorted via CLI/API
- Split-view (overlapping public and private) for Public and Internal use the same zone name
 
### CNAME vs Alias
 
- CNAME is invalid for naked/apex e.g. name of the domain
- Many AWS Services use a DNS Name e.g. (ELBs)
- An Alias record maps a Name to an AWS resource
- There is no charge for ALIAS requests pointing at AWS resources
- For AWS Services - default to picking Alias records
- Should be the same Type as what the record is pointing at
- API Gateway, cloudfront, Elastic Beanstalk, ELB,Global Acclerator & S3 = Alias A Records
 
### Simple routing
 
- One record per name , each records can have multiple values
- simple routing does not supprt health checks
 
### Health Checks
 
- Health checks are seprate from, but are used by records
- Health checkers are located globally
- Health checker check every 30s (every 10s costs extra)
- Checks can be TCP,HTTP,HTTP HTTP/HTTPS with string matching
- Three types of checks Enpoint, CloudWatch Alarm, Checks of Checks (Caclulated)
- if 18%+ of health checkers report as healthy, the health check is healthy
 
### Failover routing
 
- With failover routing you can add mutlipul records of the same name Primary, Secondary
- A common architecture is to use failover for a "out of band" failure maintence page for a service
- The health event occurs on the primary record, if the prmary value fails the check returns the second value
- Use it for active/ passive failover scenerios
- Active backup architures were s3 is used as backup
 
### Multi value routing
 
- Hosted zone, many records same name
- Each record can have an assocted health check. 
- up to 8 healthy records are returned if more than 8 exist 8 are randomy selected from the set
- Improves avaliblity - active active request
- It is not a replacement for load balancing
 
### Weighted routing
 
- Simple Load balancing or testing new software versions
- A weight of 0 means a record is never returned unless all are 0 then all are considered
- if a chosen record is unhealthy the process of selection is repeated until a healthy record is chosen.
 
### Latency Based Routing
 
- Use latency based routing when optimising for performance and user experience
- Speficy a record with the same name per region
- In the background AWS maintains a database of latency betweet general locations
 
### Gelocation Routing
 
- When you create gelocationrecords you tag them with the location
- ISO Country, contiant codes, sub devision
- Geolaction doesn't return the closest records only the relevant
 
### Geoproximity
 


### Databases
 
- Row based databases (OLTP) Online Transaction Processing (MYSQL)
- Columm Store (Redshift)
 
- Graph database , socal media HR, Systems with complex relationships.
 
## ACID - BASE
 
- ACID and BASE are DB transction models
- Partition Tolerant (Resilience), Consistency, Availability
- ACID = Consistency
    - Atomic, Conisitent, Isolated, Durable = RDS limits scaling (Fincical Instutions)
- BASE = Availablity
    - Basically Available, Soft State, Eventually Consistent (any reads to a database ae evently consistant)
    - Highly scalable (Dynamodb) NOSQL Databses
 
## Database on EC2
 
- Access to the DB instance OS Level Access
- Adavnced DB Option tuning (DBROOT)
- Vendor demands
- DB or DB Version AWS don't provide.
 
## RDS Database 
 
- Create subnet group to add subents in group
- it how rds knows where to place instance into.
 
## RDS MuiltAZ
 
- No Free Tier extra cost for standby replica
- Standby can't be directly used.
- 60- 120 seconds Highy available  not faunt tollerant
- Same region only (other AZs in the VPC)
- Backups taken from the standby replica (removes performance impact)
- AZ Outage, Primary Failure,Manual failover,instance type change and software patching
- Syncrozious Repolication
 
## RDS Backups and Restores
 
- RTO Recovery Time Objective
- RPO Recovery Point Objective
- Creates a new rds instance (creates a new address) when you retore
- Automated = any 5 minute point in time
- Backup is restored and transctiob logs are replyaed to bring DB to desired point in time
- Restores aren't fast - think RTO
 
## RDS Read-Replicas
 
- Performance, Avaliabilty
- Async means read replica
- Sync means multi az
- 5x direct read-replicas per db instance
- Snapshots and backups Impove RPO
- RTOs are a problem
- RRs offer nr 0 RPO
- RRs can be promoted quickly low RTO
- Failure only - watch for data corruption
- Read only until promoted
- Global avaliability improvments.. global resilience
 
## RDS Security
 
- SSL/TLS in transit is available for RDS, can be mandatory
- RDS supports EBS Volumes encryption - KMS
- Handled by HOSTS/EBS
- AWS Customer Managed Key gernerates data keys
- Data Keys are used for encryption operations
- Storage, Logs, Snapshots are replicas are encrypted
 
### TDE Transparent Data Encryption
 
- Encryption handled with the DB Engine
- RDS Oracle supports integration with CloudHSM
- Much stronger key controls (even from AWS)
 
### IAM Authentication

- Authorisation is controlled by DB Engine, Permissons are assigned
to the local DB User IAM is NOT Used to authorise, only for authentication.
- Policy attached to Users or Roles maps that identity onto the RDS User

-

## Amazon Aurora
 
- Cluster
- A single prmary instance + 0 or replicas
- No local storage, uses a shared cluster volume, SSD Based 128Tib 6 Replicas AZs
- Primmary Instnce and a number of replicas, replication happens at a storage level.
- Cross 3 AZs, Avoids data loss
- Up to 15 Replicas and any of them can be the failover target for replication.
- All SSD Based on High IOPS, Low latency
- Storage is billed on based on whats used.
- High Water mark - billed for most used
- Storage which is freed up can be reused
- Replicas can be added and romved without requiring storage provisioning
- Auroa Cluster enpoint always points top the primary instance
- Reader Endpoint will loadballance accross all replicias
- Custom Endpoints
- No free tier.
- Compute - hourly charge, per second 10 minute minimum.
- Storage - GB-Month consumed, IO cost per request
- 100% DB Size in backups are included
- Backtrack can be used to rewind to a previous point in time
- Fast clone make a new databse MUCH faster than copying all the data  copy-on-write
 
## Aurora Serverless
 
- Scalable ACU Aurora Capacity Units
- Aurora Serverless cluster has a MIN and MAX ACU
- Cluster Adjusts based on load
- Can go to 0 and be paused
- Consumpton billing per-second basis
- Same reslience as Aurira (6 copies across AZs)
- Infrequently used applications as you consume
- New applications
- Variable workloads
- Unpredicatble workloads
- Development and test databases
- Multi-tentant applications
 
## Aurora Global Database
 
- Cross-Region DR and BC
- Global Read Scaling low latency performance improvements
- ~1s or less replication between regions
- No Impact on  DB perfromance
- Secondary regions can have 16 replicas
 
## Aurora Multi Master
 
- Default mode is Single-Master
- One R/W and 0+ Read Only Replicas
- Cluster Endpoint is used to write,read endpoint is used for load balanced reads
- Failover takes ime - replica promoted to R/W
- In Multi-Master mode all instances are R/W
 
## DMS
 
- A managed database service
- Runs using a replication instance, task
- Source and Destination Endpoints point at the Source and Target Databases
- One endpoint MUST be on AWS
- Full Load Migration = (one off migration of all data)
- Full Load + CDC (Change data capture) for on goging replication which captures changes
- CDC Only (if you wnat to use an alternative method to transfer the bulk data .. such as native tooling)
- SCT Schema Conversion Tool
- No downtime = DMS



## EFS
 
- EFS is an implementation of NFSv4
- EFS Filesystem can be mounted in linux
- Shared between many EC2 Instances
- Private service, via mount targets inside a VPC
- Can ba accessed from on-premises using VPN or Direct Connect
- Linux only instances
- General Purpose and max IO Performance Modes
- General Purpose = default for 99% of uses
- Bursting and Provisoned Throughput Modes
- Storage Classes Standard and IA Classes
- Standard is the default
- Life cycle polices can be used with classes



## ALB
 
- ALB is layer 7 LB understands HTTP/S
- Scalable and highly-avalable
- Target group is just a collection of targets
- Internet facing or Internal
- Listens on the outside < Sends to target Groups
- Houly rate and LCU Rate (Capacity)
- Targets = Target Groups which are addressed via rules
- Rules are path based or host based.
- Supports EC2mECS EKS Lambda, HTTPS, HTTP/2 and websockets
- ALB can use SNI for multiple SSL Certs - host based rules
- Only use clasic load balancers for legacy
 
## Launch Configurations
 
- Allows you to define teh configuartion of an EC2 instance in advance
- AMI, Instance Type,Stoarge & key Pair
- Networking & Storage groups
- Userdata & IAM Role
- Both are NOT editable - defined once LT has versions
- Launch Templates Provides newer features - including T2/T3 Unlimited Placement Groups, Capacity Reservations, Elastic Graphics
 
## Auto Scaling Groups
 
- Automatic scaliing and Self Healing for EC2
- Uses Launch Templates or Configurations
- Has a Minimum, Disired and Maximum Size e.g (1:2:4)
- Provison or Terminate Instances to keep at the desired level(between min/max)
- Scaling Polcies are rules
    - Manual Scaling - Maunally adjust the desired capacity
    - Scheduled Scaling - Time based adjustment 
    - Dynamic Scaling
     - Simple - Define a rule based on a metric ("CPU above 50% +1) (CPU below 50-1)
     - Stepped Scaling - Bigger +/- based on diffrence
     - Target Tracking - Desired Aggregate CPU = 40% .. ASG handle it
- Cooldown Periods
- Self Healing
- load balancers
- Autoscaling groups are free
- Use calldown periods to avoid rapid scaling
- Think about smaller instances - granualarity
- USe with ALBs for elasticity - abrasction
- ASG defines WHEN and WHERE, LT defines WHAT



## NLB
 
- NLBs are Layer 4 only understanding TCP and UDP
- can't understand http/s but are faster 100ms vs 400ms for application load balancers
- Rapid scaling  - millions of requests per second
- 1 interface w/ static IP per AZ and use Elastic IP (whitelisting)
Can do SSL Pass through
- Can load balance non HTTPS appliactions -doesn't are about anything above TCP/UDP
 -
## SSL Offload & Session Stickiness
- Bridging
  - Listener is configured for HTTPS Connection is terminiated
  on ELB & certicate is needed for the domain name
  - ELB Iniates a new SSL instances need SSL certifcates and the compute required for cryptographic operations
- Passthough
  - Listener is configiured for TCP, NO encryption or decryption happends on NLB connection is passed to backend instance
  - The client connects Each instance needs appropiate SSL cert install With this architecture there is no certificate exposeure to AWS all self managed and secure, the LB doesn't need certcates installed as it does with bridging 
 
- Offload
  - Listener is configured for HTTPS connections are terminated and then backend connections use HTTP
  - ELB to the connections use HTTP no certifacte ir cryptographoc operations

## Connection Stickiness
  - AWSALB Cookie 1s to 7 days
  - Server Failour or cookie expries 
  - Uneven load on backend server.



## Event Driven Architecture

### Lambda
- Functiom as a service FaaS
- Event driven invocation ( execution)
- Lambda function = piece of code in one language
- Lambda functions use a runtime ( e.g Python 3.6)
- Runs in a runtime environment
- execution role
- 15min execution limit
- new run time every execution
- Load data from other services such as s3 dynamoDB no persitant
- Lamaba comes under free tier 1Gb memory 1 million executions per month

### Cloud watch events and Events Bridge

- if X happens or at Y times do Z
- EventBridge is .... Cloudwatch Events
- a default Event bus for the account
- In cloudWatch Events this the only bus(implict)
- EventBridge can have additional event busses
- Rules match incoming events .. (or schedules)

## API Gateway 

- API Gateway is a managed service from AWS which allows the creation of API Endpoints, Resources & Methods.

- Create, Publish, Monitor and Secure APIs as a Service

- The API gateway integrates with other AWS services - and can even access some without the need for dedicated compute

- It serves as a core component of many serverless architectures using Lambda as event-driven and on-demand backing for methods.

- It can also connect to legacy monolithic applications and act as a stable API endpoint during an evolution from a monolith to microservices and potentially through to serverless.

- Billed based on Number of API Calls, Data Transfer and addtional performance features susch as caching

- Can be used for server archeture

## Serverless architecture 

- Serverless isn't one single thing
- You manage few if any servers - low overhead
- Applications are a collection of small & specialised functions
- ..Stateless and Ephermal enviorments - durantion biling
- Event driven ..comsuption only when being used
- FaaS is used where possible for compute functionality
- Managed services are used where possible  

## SNS

- The Simple Notification Service or SNS .. is a PUB SUB style notification system which is used within AWS products and services but can also form an essential part of serverless, event-driven and 
traditional application architectures.

- Public AWS Zone

- Delivery Status (Http,Lambda,SQS)
- Delivery Retries - Reliable Delvery
- HA and Scalable (Region)
- Server Side Encryption SSE
- Cross-Account via <ins>TOPIC Policy</ins>

- Messages are <= 256 payloads

- SNS Topics are based  on entity of SNS permissons and configuration

- Publishers send messages to TOPICS

- Subscribers receive messages SENT to TOPICS. e.g (HTTPs), Email)-JSON,SQS Mobile Push, SNS Messages and Lambda

- SNS supports a wide variety of subscriber types including other AWS services such as LAMBDA and SQS

## Step Functions

- Step functions is a product which lets you build long running serverless workflow based applications within AWS which integrate with many AWS services.

- States and things which occur
- Maximum Duration 1 year 
- Standard Workflow and Express workflow 5 mins
- Started cia API Gateway, IOT Rules,EventBridge, Lamabda
- Amazon States (ALS) - JSON Temlate
- IAM Role is used for permisions
- State machines are long running serverless workflows

### States

- SUCCEED and FAIL
- WAIT (Wait for point in time or bassed on date)
- CHOICE (Condition)
- PARALLEL (Do somthing passed from CHOICE)
- MAP (List of Things, Orders)
- TASK (Single unit of work perfomed by a state machine)

## SQS 

- Public, Fully Managed, Highy-Avaiable Queues - Standard or FIFO
- FIFO Guarantee an order
- Standard queue best efforts
- Messages up to 256Kb in size link to large data
- Received messages are hidden <ins>(VisibilityTimeout)</ins> hidden for ammount of time then reppears (retry) or are explicitly deleted.
- Dead-Letter queues can be used for problem messages (5 or more times)
- ASGs can scale and Lambdas inovle based on queue length

- Worker Pool. 
- Web Pool 
- SNS and SQS Fanout - each size has its own queue and autoscaling group.
- SQS queues are a managed message queue service in AWS which help to decouple application components, allow Asynchronous messaging or the implementation of worker pools.
- Standard queues at-least once, FIFO = exactly-once
- FIFO (Performance)
- 1 request = 1-10 messages up 258kb total 
- Short (immediate) va Long(waitTimeSeconds)Polling
- Long polling uses fewer requests
- Encrypton at rest (KMS) & in-transit
- Indentity Policy or Queue Policy

## Kinesis & Kinesis Firehose

- Kinesis data streams are a streaming service within AWS designed to ingest large quantities of data and allow access to that data for consumers
- Producers send data into kinesis stream
- Streams can scales from low to near infinte data rates
- Kinesis is ideal for dashboards and large scale real time analytics needs.
- Public Service & hihly avalible
- Streams store a 24-hour moving window of data
- Kinesis data firehose allows the long term persistent storage of kinesis data onto services like S3
- Producers > Kinesis Stream > Consumers
- As Single Kinesis stream adds shards
- 1Mb Ingestion , 2Mb Consumption
- 24hr roling window can be increased to 7 day for addtional cost
- Kinesis data Record (1Mb)
- SQS vs Kinesis injestion of data = Kinesis
- Streaming data
- Worker pool, decouple, Asynchronous communications = SQS
- Kinesis designed for huge scale injestion
- Data ingestion, Analytics, Montoring, App Clicks

## Amazon Cognito - User and Identity Pools

- Authenication, Authorization and user management for web/mobile apps
- USER POOLS - Sign-in and get a JSON Web Token JWT
- IDENTITIY POOLS - Allow you to offer access to Temporary AWS Credentials
- Web Indentity Federation = userpool = identity pool
- Federated Indetities SWAP - Google, Facebook, Twitter, SAML2.0 & user Pool for short term AWS Credentials to access AWS Resources

- A user pool is a user directory in Amazon Cognito. With a user pool, your users can sign in to your web or mobile app through Amazon Cognito. Your users can also sign in through social identity providers like Google, Facebook, Amazon, or Apple, and through SAML identity providers. Whether your users sign in directly or through a third party, all members of the user pool have a directory profile that you can access through a Software Development Kit (SDK).

- Amazon Cognito identity pools (federated identities) enable you to create unique identities for your users and federate them with identity providers. With an identity pool, you can obtain temporary, limited-privilege AWS credentials to access other AWS services. 

## CloudFront Architecture Basics

- Cloud Front is a global oject cache (CDN)
- Content is cached in loaions close to customers
- Lower latency and higher throughput
- Load on the content server is decreased 
- it can handle static and dynamic content
- Edge > Regional Edge > Origin Fetch
- Integrates with ACM for HTTPS
- Upload directs to origins No caching. (PUTS),
- Cloudfront performs no write caching
- Forward to Origin, (if yes use for caching ALL or Selected) Yes or No Query String Parameters


<ins>Terms</ins>

- Origin - The source location of your content
- Distribution - The configuraton unit of Cloudfront
- Edge Location - Local infrastructure which hosts cache of your data
- Regional Edge Cache - Larger version of edge location. Provides another layer of caching.

## ACM  (AWS certificate Manager)

- HTTP - Simple and Insecure
- HTTPS - SSL/TLS Layer of Encryption added to HTTP
- Data is encrypted in transit
- Cetificates prove identity
- Signed by a trusted authority CA
- Create, renew and deploy certifcates with ACM
- Supported AWS Services ONLY (e.g Cloudfront and ALBs .. NOT EC2)
- Cloudfront if communicatiny with edge and orgin with https it needs to use a trusted signed certificate

## Securing CF and S3 using OAI

- Origin Access Identities are a feature where virtual identities can be created, associated with a CloudFront Distribution and deployed to edge locations.

- Access to an s3 bucket can be controlled by using these OAI's - allowing access from an OAI, and using an implicit DENY for everything else.

## Lambda@Edge

- you can run lightweight lambda at edge locations
- Adjust data between the viewer & origin
- Supports Node.js and Python
- Run in the AWS Public Space (Not VPC)
- Layers are not supported
- Different Limits vs Normal Lambda Functions

- Connect between  Customer end edge location known as <ins>viewer request</ins> 
- Edge location and origin known as  <ins>Origin Request</ins>
- Origin and cloudfron edge known as <ins>Origin Response</ins>
- Connection between the edge location and the customer known as <ins>Viewer response</ins>

- Limit 1028 Mb 5 Seconds timeout (Viewer Request - Viewer Response)
- Normal Lambda MB 30 Seconds (Origin Request Origin Response)

<ins>Use Cases</ins>

- A/B Testing - Viewer Request
- Migration Between S3 Origins - Origin Request
- Different Objects Based on Device - Origin Request
- Content By Country - Origin Request

- Lambda@Edge allows cloudfront to run lambda function at CloudFront edge locations to modify traffic between the viewer and edge location and edge locations and origins.

## Global Accelerator

- AWS Global Accelerator is designed to improve global network performance by offering entry point onto the global AWS transit network as close to customers as possible using ANycast IP addresses
- Moves the AWS Network closer to customers
- Connections enter at edge user anycast IPs
- Transit over AWS backbone 1+ locations
- Can be used for NON HTTP/s (TCP/UDP) **Diffrence from cloudFront
- Global Performance , doesn't cache its a network product Transisting network data.

## VPC FLow Logs

- Capture packet Metadata .. Not packet contents
- Applied at a VPC - All interfaces in that VPC
- Subnet - interfaces in that subnet
- Internet directly
- VPC Flow Logs are NOT realtime
- Destination can be S£ or CloudWatch Logs
- ICMP =1, TCP=6, UDP=17
- srcaddr followed by dstaddr
- Flow logs does't capture 
 - 169.254.169.254 (metadata instance)
 - Amazon DNS Server and Amazon Windows license or DHCP Traffic 
- VPC FLow logs is a feature allowing the monitoring of traffic flow to and from interfaces within a VPC
- VPC Flow logs can be added at a VPC, Subnet or Interface level.
- Flow Logs DON'T monitor packet contents ... that requires a packet sniffer.

<ins>List</ins>

- version
- accountid
- interface-id
- <ins>srcaddr</ins>
- <ins>dstaddr</ins>
- <ins>srcport</ins>
- <ins>dstport</ins>
- <ins>protocol</ins>
- packets
- bytes
- start
- end
- <ins>action</ins>
- log-status

## Egress-Only Internet gateway

- Egress-Only internet gateways allow outbound (and response) only access to the public AWS services and Public Internet for IPv6 enabled instances or other VPC based services.

## VPC Endpoints (Gateway)

- Provide private access to S3 and DynamoDB
- Per service per region
- Prefix List added to route table => Gateway Endpoint
- Highly Avaible (HA across all AZs in region by default)
- Endpoint policy is used to control what it can access
- Regional .. can't access cross-region services
- Prevent Leak Buckets - S3 Bucket can be set to private only
by allowing access ONLY from a gateway endpoint.


## VPC Endpoints (Interface)

- Inteface enpoints are not Highly avalable
- Added to specfic an ENI not HA
- For HA add one endpoint to one subnet, per AZ used in VPC
- Network access controlled via Security Groups
- Endpoint policies - rescirct what can be done with endpoint
- TCP and IPv4 ONLY
- Uses PrivateLink
- Interface endpoints use DNS
- Endpoint Regional DNS 
- Endpoint Zonal DNS
- PrivateDNS overrides the default DNS for services

- Interface endpoints are used to allow private IP addressing to access public AWS services.
- S3 and DynamoDB are handled by gateway endpoints - other supported services are handled by interface endpoints.
- Unlike gateway endpoints - interface endpoints are not highly available by default - they are normal VPC network interfaces and should be placed 1 per AZ to ensure full HA.

## VPC Peering

- Direct encrypted network link between two VPCs
- Works same/cross-region and same/cross-account
- (optional Public Hostnames reslove to private IPs
- Same region SGs can reference peer SGs
- VPC Peering does NOT support transtive peering
- Routing Configuration is needed, SGs & NACLs can filter
- Routing tables at both sides of teh peering connection are needed, directing the flow for the remote CIDR at perr gateway object
- VPC Peering connections cannot by created where there is overlap in the VPC CIDRS Ideally NEVER use the same address ranges in multiple VPcs.
- NO VPC Peer between A and C doesn't work,peering is not Transtive

- VPC peering is a software define and logical networking connection between two VPC's

- They can be created between VPCs in the same or different accounts and the same or different regions.

## AWS Site to Site VPN

- A logical connection between a VPC and on-premises network
encrypted using IPSec, running ovet the public network
- Full HA if you dessign and implement it correctly
- Quick to provision .. lee than hour
- Virtual Private Gateway (VGW)
- Customer Gateway (CGW)
- VPN Connection between the (VGW) and (CGW)
- Dynamic VPNs need BGP (ASN)
- Route Propergation form (VGW)
- Speed Limitations 1.25Gps
- Latency Coniserations - inconsistent, public, internet
- Cost AWS hourly cost, GB out cost, data cap (on premises)
- Speed if setop - hours .. all software coniguration
- Can be used as a backup for Direct Connect (DX)
- Can be used with Direct Connect(DX)

## AWS Direct Connect (DX)

- A 1Gbps or 10Gbps Network Port into AWS
- at a DX Location (1000-Base-LX ot 10GBASE-LR)
- to you customer router (requires VLANS/BGP)
- or Partner Router (if extending to you location)
- Multiple Virtual Interfaces (VIFS) over one DX
- Private VIF(VPC) & Public VIF (Public Zone Services)
- NO HA and NO Encryption
- Public VIF = Public AWS Services (NO Public Internet)
- VIFS = one VLAN & Once BGP session at the client side
- Private VIF = One VPC (Multiple Private VIFS)
- Take Much longer to provision vs VPN
- DX Port provisioning the cross connect takes longer
- extenstion to premises can take weeks/months
- Use VPN first then replace with DX (Or leave as backup)
- Faster .. 40Gbps with Aggregation
- Low consistent lactency, doesn't use business bandwidth
- (DX) = NO Encyption
- IPSEC VPN Over public VIF 

## Direct Connect (DX) Resilience and HA

- AWS Regions have multiple Direct connect (DX)
- Locations these are normally metro DCs
- DX Locations are connected to the AWS region via redundant high speed 
connections
- AWS DX Router > Customer Provider DX Router (vi Cross Connect Cable)
- A DX is extended from the DX locations to customer premises
- 2 DX connections > Provisoned 2 Seperate Customer DX Routers > 2 Customer Premises Routers

## Transit Gateway (TGW)

- Network Transit Hub to connect VPCs to on premises networks
- Significantly reduces network complexity
- Single network object - HA and Scalable
- Attachemnets to there network types
- VPC, Site-to-Site VPN & Direct Connect Gateway
- VPC Attachments are configured with a subnet in each AZ where service is
required
- Peering Attchment (Cross-Region Same/Cross Account)
- TGW can intrgrate with direct connect gateway using transit VIF
- TGW supports multipul route tables allowing complex routing architectures.
- TGW Supports transitive routing
- Can be used to create global networks
- Share between accounts using AWS RAM
- Peer with diffrent regions .. same or cross account
- Less complexity vs w/o TGW

- The AWS Transit gateway is a network gateway which can be used to significantly simplify networking between VPC's, VPN and Direct Connect.

- It can be used to peer VPCs in the same account, different account, same or different region and supports transitive routing between networks.

## AWS Storage Gateway 

- Hybrid Storage Virtual Appliance (On-Premises)
- Extension of File & Volume Storage into AWS
- Volume storage backups into AWS 
- Tape Backups into AWS
- Migration of existing infrastructure

- Modes 
 - Tape Gateway (VTL) Mode
    - Virtual tapes => S3 and Glacier
 - File Mode - SMB and NFS
 - Volume Mode (Gateway/Stored) - iSCSI
  - Block storage backup S3 and EBS Snapshots

- File Gateway mode.
    - SMB shares can integrate with active directory for file authorisation
    - Files are store to shares using NFS or SMB
    - Life cycle policies can automatically control Storage Classes
    - Mapped dierctly 1:1 as s3 objects.
    - Additional Capictiy or Decomm existing file storage infrastructure.

- Tape Gateway (VTL)
    - Tape gatway mode (Pretends to be iSCSI tape, library, changer and drive)
    - Virtual tape 100 Gib -> 5 TiB
    - 1PB total storge across 1500 virtual tapes
    - Active tapes are stored in s3,archived/exported tapes
    are stored in VTS in Glacer

- Volume Gateway (Stored) (Migrations Data Recovery) Local stoarge Primary
    - App Server on Premises 
        - Local storage & Upload Buffer => Storage gateway endpoint => EBS Snapshots
        - 16TB per volume, 32 Volumes (MAX)
        - 512TB total capacity 

    - Primary data is stored on-premises 
    - backup data is asynchronusly replicated to AWS
    - Volumes are made avalible via iSCSi for network based servers to acesss (single connection per volume
    unless servers are clustered)
    - Ideal for backup, migrations and business data continuity

- Volume Gateway(Cached) (Frequently accessed data) AWS Primary
  - Volumes are made avalible via iSCSi for network based server to 
  access (single connection per volume unless servers are clustered)
  - Primary Data is stored in AWS. Data which is accessed frequently is cached locally
  Ideal for extending storage into AWS.
  - Frequently accessed data
  - Limited Local staorge capacity
  - 32TB per volume, 32 volumes (MAX)
  - 1PB total capacity

  ## Snowball, Snowedge Snowmobile

  - Move large amounts of data IN or OUT of AWS
  - Physical Storage
  - Ordered from AWS Empty, Load up, Return
  - Ordered from AWS with data, empty & Return

  ### Snow ball (Storage)

- Ordered from AWS, Log a job, Device Delivered (not instant)
- Data Encrpytion uses KMS
- 50TB or 80TB Capacity
- 1 Gbps (RJ45 1Gbase-TX) or 10Gbs (LR/SR) Network
- 10 TB to 10 PB economical range (multiple devices)
- Multiple devices to multiple premises
- Only Storage

  ### Snowball Edge (Storage - Compute)

- Both Stoarge and Compute
- Larger capacity vs Snowball
- 10 Gbs (RJ45), 10/24(SFP), 45/50/100 Gbs(QSFP+)
    - Storage Optimized (with EC2) - 80TB, 25 vCPU, 32Gib RAM,1TB SSD
    - Compute Optimized - 100TB + 7.68 NVME, 52 vCPU and 208 Gib RAM
    - Compute with GPU as above .. with GPU
    - ideal for remote sites or where data processing is needed

  ### Snowmobile

- Portal Data Centre within a shipping contatiner on a truck
- Special order
- Ideal for single location when 10 PB+ is required
- Up to 100PB per snowmobile
- not encomical for multi-site(unless huge) or sub 10PB

## Directory Service

- Store objects (users, groups, computers and filer servers) with a structire (domain/tree) inverted tree
- Mutilple tress can be grouped 
- AWS Managed Implementation. no admin overhead 
- Run within a VPC
- To implement HA .. deply inito multiple AZs
- Some AWS Services NEED a directory e.g. Amamzon Workspaces
- Can be isolated
- or integrated with on-premises systems
- or act as a proxy back to on-premise

- Simple AD Mode. An implementation of Samba 4 (compatibility with basics AD functions)
    - 2 size small 500(users) large 5000(users)

- AWS Managed Microsoft AD - An actual Microsoft AD DS Implementation
    - Instance of AD inside AWS 
    - Service can integreate with AWS
    - Create a trust between AWS and on-premises 
    - Reslient if the VPN fails services in AWS will still be able
    to access the local directory directory service

- AD Connector
    - Allows AWS services which NEED a directory to use an existing on-premises directory
    - if the private connectivity fails the AD proxy won't function - interrupting service at the AWS side

- AWS Datasync
    - Data Transfer service TO and from AWS
    - Migrations, Data Processing Transfersm Archival Cost effective storage or DR/BC
    - Designed to work at hugh scale.
    - Keeps metadata (e.g permissions/timestamps)
    - Built in data validation

- Key features
    - Scalable - 10Gbs per agent (~100TB per day)
    - Bandwidth Limiters (avoid link saturation)
    - Incremental and scheduled transfer options
    - Compression and encryption
    - Automatic recovery from transit errors
    - AWS Service integration - S3, EFS, FSx
    - Pay as you use .. per GB cost for data moved
    - Integates with EFS and Fsx

    - Task a job within datasync, defines what is being synced, how quickly and from where to where
    - Agent software used to read or write to on premises data stores using NFS or SMB
    - Location every task has two locations FROM and TO E.g. Network File System (NFS), Server Message Block (SMB), Amazon EFS, Amazon FSx and Amazon S3

## FSx for Windows Servers
   
- Fully Managed native windows fileservers
- Designed for integration windows environments
- Integrate with Directory Service or Self managed AD
- Single or Multi-AZ mode within a VPC
- On-demand and Scheduled Backups
- Accessible using VPC, Peering, VPN, Direct Connect
- Supports managed of self managed AD (on premises)
- Native windows filesystem, supports de-duplication, Distrubuted File system DFS, KMS at rest encryption and enforced encryption in transit and allows for volume shadow copies (file level versioning)
- highly performant range from 8MB/s 2GB/s, 100k IOPS <1ms latency
- VSS - User-Driven Restores
- Native file systems accessible over SMB
- Windows permission model
- Supports DFS .. scale out file share structure
- Managed - no file server admin
- Integrates with DS and your own directory

- FSx for Windows Servers provides a native windows file system as a service which can be used within AWS, or from on-premises environments via VPN or Direct Connect

- FSx is an advanced shared file system accessible over SMB, and integrates with Active Directory (either managed, or self-hosted).
    
- It provides advanced features such as VSS, Data de-duplication, backups, encryption at rest and forced encryption in transit.

## FSx for Lustre

- Managed Lustre - Designed for HPC - LINUX Clients (POSIX)
- Machine Learning, Big Data, Fincail Modelling
- 100 GB/s throughput & sub millisecond latency
- Deployment types - Persistent or Scratch

- Scratch Highly optmised for Short term no replication & fast
    
- Persistent - Longer term, HA (in one AZ),self-healing
- Acessible over VPN or Direct Connect


- S3 Bucket(Respositry) > Fsx Lustre(file system)
- Data is Lazy loaded from S3 (S3 linked reposisty) into the file system as needed
    
- Sync changes data can be exported using s3 hsm_archive command
- Metadata stored on Metadadta Tragets (MDTs)
- Objects are stored on called object targets (OSTs) (1.17TiB)

- Baseline performance based on size
- Size min 1.2iB then increments to 2.4TiB
- for stratch - Base 200 MB/s per TiB of storage
- Persistent uo to 1,300 MB/s per TiB (Credit System)

- Stratch is designed for pure performance
    - Short term or temp workloads
    - NO HA or REPLICATION

- Persistent has replication within ONE AZ only
    - Auto-heals when hardward failure occurs
    - you can backup to s3 with both (manual or automatic 0-35 days retention)