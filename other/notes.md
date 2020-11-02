## CI / CD

### What is DevOps?
In the simplest term, DevOps is the grey area between development (Dev) and operations (Ops) teams in a product development process. DevOps is a culture in which communication, integration, and collaboration in the product development cycle are emphasized. Thus, it eliminates the silos between software development and operations teams, allowing them to enable rapid and continuous product deployment.

### What is continuous integration?
Continuous integration (CI) is the process of automatically integrating code changes from multiple developers into a shared repository. Automated tests are utilized to verify and assert the additional codes generate no conflict with the existing codebase. Ideally, code changes should be merged multiple times a day, at every commit with the help of CI tools.

### What is continuous delivery?
Continuous delivery, together with continuous integration makes a complete flow for deliverable code packages. In this phase, automated building tools are applied to compile artifacts and have them ready to be delivered to the end user. With that in mind, in a CD environment, new releases are just one click away from being published with fully functional features and minimal human intervention.

-----

### What is continuous deployment?
Continuous deployment takes continuous delivery to the next level by having new changes in code integrated and delivered automatically into the release branch. More specifically, as soon as the updates passed all stages of the production pipeline, they are deployed directly to the end user without human intervention. Thus, to successfully utilize continuous deployment, the software artifacts must go through rigorously established automated tests and tools before deployed into the production environment.

### What is continuous testing and its benefits?
Continuous testing is the practice of applying automated tests early, gradually and adequately in the software delivery pipeline. In a typical CI/CD workflow, builds are released in small batches. Therefore, it is impractical to manually perform test cases for each delivery. Automated continuous testing eliminates the manual steps and turn them into automated routines, which reduces human effort. That’s why automated continuous testing is essential for the DevOps culture.

### Benefits of continuous testing:

Ensures the quality and speed of the builds.
Enables faster software delivery and a continuous feedback mechanism.
Detect errors as soon as they occur in the system.
Reduce business risks. Evaluate potential problems before they become real problems.
What is version control and its uses?
Version control (or source control) is a respiratory in which all changes in the source code are stored and managed at all times. The version control provides an operating history of code development that allows developers to unwind if they made any mistakes, compare between versions and finalize with the best version of the code. All the code versions must be updated and checked into the version control, making it the single source of truth that is applicable for all environments.


-----

CI

- Build  [ maven, Jenkins ]
- Test   [ sonarkube, testkitchen]
- Merge  [ git, Sourcecontrol ]

CD 

- Release [Nexus, Cloudbees Flow, ]
- Deploy  [Docker, K8s ] 
- Monitor []

-----

### AWS Connect

Amazon Connect enables you to create an omnichannel contact center: a contact center that provides a unified experience across multiple communication channels, such as voice and chat.

In Amazon Connect you build once and enable the experience for both voice and chat channels:

You use the same routing profiles, queues, contact flows, metrics, and reports for both channels.

Managers monitor both channels from one dashboard.

Agents handle all customers from just one interface. If a customer interaction starts with chat and moves to voice, the agent handling the voice call has the complete chat transcript so context is preserved.

You can create highly personalized experiences for your customers using omnichannel communications, and separate the channels where needed. For example, you can dynamically offer chat and/or voice contact based on such factors as customer preference, estimated wait times, and agent skill.

This section explains concepts that will help you set up your Amazon Connect contact center, whether you use one channel or two.

### Contents

- Telephony
- Chat
- Routing profiles
- Queues: standard and agent
- Queues: priority and delay
- Queue-based routing
- Channels and concurrency
- Contact flows

In Amazon Connect, routing consists of three parts: queues, routing profiles, and contact flows.

- Queue
    -   A queue holds contacts waiting to be answered by agents. You can use a single queue to handle all incoming contacts, or you can set up multiple queues.

-   Routing Profile 
    -   A routing profile determines what types of contacts an agent can receive and the routing priority.
        Each agent is assigned to one routing profile.

    -   A routing profile can have multiple agents assigned to it.

-   Contact flow
    -   Contact blocks are the building blocks of your contact flows. Each block is designed for a     specific function a business might want in a contact center.

-   Set working queue. When the contact comes in, this block assigns it to the BasicQueue.

    -   Check hours of operation. This block checks whether the contact has arrived when the queue is  operating.

    -   Transfer to queue. This block transfers the contact to the BasicQueue.

    -   Play prompt. If the queue is not open for business, or there's an error or it's at capacity, this block plays a message "We are not able to take your call right now."

    -   Disconnect/hang up. Every flow ends with this block.

    ----

    Lambda

    



