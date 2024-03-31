# &#x1F6A9; terraform and container localstack S3 create buckets

&nbsp;

&nbsp;

&#x1F516; Information on the user's device.<br />

<pre>
    ❯ system_profiler SPSoftwareDataType SPHardwareDataType

        Software:
            System Software Overview:
                System Version: macOS 13.3.1 (22E261)
                Kernel Version: Darwin 22.4.0
                Boot Volume: Macintosh HD
                Boot Mode: Normal    
                . . .

        Hardware:
            Hardware Overview:
                Model Name: MacBook Pro
                Model Identifier: MacBookPro17,1
                Model Number: MYD82ID/A
                Chip: Apple M1
                Total Number of Cores: 8 (4 performance and 4 efficiency)
                Memory: 8 GB
                . . .
</pre>

&nbsp;

Container building software.
<pre>
    ❯ docker info

        Client:
        Context:    default
        Debug Mode: false
        Plugins:
        buildx: Docker Buildx (Docker Inc., v0.8.2)
        compose: Docker Compose (Docker Inc., v2.5.0)
        sbom: View the packaged-based Software Bill Of Materials (SBOM) for an image (Anchore Inc., 0.6.0)
        scan: Docker Scan (Docker Inc., v0.17.0)

        Server:
        Containers: 0
        Running: 0
        Paused: 0
        Stopped: 0
        Images: 0
        Server Version: 20.10.14
        Storage Driver: overlay2
        Backing Filesystem: extfs
        Supports d_type: true
        Native Overlay Diff: true
        userxattr: false
        Logging Driver: json-file
        Cgroup Driver: cgroupfs
        Cgroup Version: 2
        Plugins:
        Volume: local
        Network: bridge host ipvlan macvlan null overlay
        Log: awslogs fluentd gcplogs gelf journald json-file local logentries splunk syslog
        Swarm: inactive
        Runtimes: io.containerd.runc.v2 io.containerd.runtime.v1.linux runc
        Default Runtime: runc
        Init Binary: docker-init
        containerd version: 3df54a852345ae127d1fa3092b95168e4a88e2f8
        runc version: v1.0.3-0-gf46b6ba
        init version: de40ad0
        Security Options:
        seccomp
        Profile: default
        cgroupns
        Kernel Version: 5.10.104-linuxkit
        Operating System: Docker Desktop
        OSType: linux
        Architecture: aarch64
        CPUs: 3
        Total Memory: 3.841GiB
        Name: docker-desktop
        ID: PLXH:5EVH:6PI3:OOL2:TXV7:NJTS:V4TZ:KWI7:V4IX:NNUG:ZN7F:J6YS
        Docker Root Dir: /var/lib/docker
        Debug Mode: false
        HTTP Proxy: http.docker.internal:3128
        HTTPS Proxy: http.docker.internal:3128
        No Proxy: hubproxy.docker.internal
        Registry: https://index.docker.io/v1/
        Labels:
        Experimental: false
        Insecure Registries:
        hubproxy.docker.internal:5000
        127.0.0.0/8
        Live Restore Enabled: false
</pre>

&nbsp;

&nbsp;

---

&nbsp;

**&#x1F536; Reference :**<br />

<pre>
    <b>[ hashicorp - Terraform ]</b><br />
    - WEB | Build infrastructure
      https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-build
</pre>

&nbsp;

&nbsp;

## &#x1F530; Install Terraform (with Binary download)

<pre>https://github.com/4bumuhammad/terraform-install-with-binary-download-on-mac.os-M1</pre>

&nbsp;

---

&nbsp;

## &#x1F530; Setting up Localstack.

<pre>https://github.com/4bumuhammad/localstack-3.2-service-s3-docker-compose</pre>

&nbsp;

Docker Compose.
<pre>
    ❯ vim docker-compose.yml

        version: '3.7'
        
        services:
          localstack:
            image: localstack/localstack:3.2
            container_name: localstack
            # network_mode: bridge
            environment:
              - DOCKER_HOST=unix:///var/run/docker.sock
              - EDGE_PORT=4566
              - SERVICES=lambda,s3
              - AWS_DEFAULT_REGION=us-east-1
              - AWS_ACCESS_KEY_ID=FAKE
              - AWS_SECRET_ACCESS_KEY=FAKE      
            ports:
              - "4566:4566"
            volumes:
              - ./localstack/localstack_root:/var/lib/localstack  
              - "/var/run/docker.sock:/var/run/docker.sock"
        networks:
          default:
            name: localstack
</pre>

&nbsp;

---

&nbsp;

Run.
<pre>

    ❯ docker-compose up

        [+] Running 1/0
        ⠿ Container localstack_s3  Created                                                                                                                                                                   0.1s
        Attaching to localstack_s3
        localstack_s3  | Waiting for all LocalStack services to be ready
        localstack_s3  | 2024-03-30 17:09:56,127 CRIT Supervisor is running as root.  Privileges were not dropped because no user is specified in the config file.  If you intend to run as root, you can set user=root in the config file to avoid this message.
        localstack_s3  | 2024-03-30 17:09:56,136 INFO supervisord started with pid 29
        localstack_s3  | 2024-03-30 17:09:57,150 INFO spawned: 'dashboard' with pid 47
        localstack_s3  | 2024-03-30 17:09:57,164 INFO spawned: 'infra' with pid 49
        localstack_s3  | 2024-03-30 17:09:57,229 INFO success: dashboard entered RUNNING state, process has stayed up for > than 0 seconds (startsecs)
        localstack_s3  | 2024-03-30 17:09:57,229 INFO exited: dashboard (exit status 0; expected)
        localstack_s3  | (. .venv/bin/activate; exec bin/localstack start --host)
        localstack_s3  | 2024-03-30 17:09:58,233 INFO success: infra entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
        localstack_s3  | Starting local dev environment. CTRL-C to quit.
        localstack_s3  | Waiting for all LocalStack services to be ready
        localstack_s3  | Waiting for all LocalStack services to be ready
        localstack_s3  | Waiting for all LocalStack services to be ready
        localstack_s3  | 
        localstack_s3  | LocalStack version: 0.12.14
        localstack_s3  | LocalStack build date: 2021-07-02
        localstack_s3  | LocalStack build git hash: 8c006f12
        localstack_s3  | 
        localstack_s3  | 2024-03-30T17:10:17:INFO:localstack.utils.analytics.profiler: Execution of "load_plugin_from_path" took 766.78ms
        localstack_s3  | 2024-03-30T17:10:17:INFO:localstack.utils.analytics.profiler: Execution of "load_plugins" took 768.55ms
        localstack_s3  | Starting edge router (https port 4566)...
        localstack_s3  | Starting mock CloudWatch service on http port 4566 ...
        localstack_s3  | Starting mock Lambda service on http port 4566 ...
        localstack_s3  | Starting mock CloudWatch Logs service on http port 4566 ...
        localstack_s3  | Starting mock S3 service on http port 4566 ...
        localstack_s3  | 2024-03-30T17:10:18:INFO:localstack.multiserver: Starting multi API server process on port 48663
        localstack_s3  | [2024-03-30 17:10:18 +0000] [53] [INFO] Running on https://0.0.0.0:4566 (CTRL + C to quit)
        localstack_s3  | 2024-03-30T17:10:18:INFO:hypercorn.error: Running on https://0.0.0.0:4566 (CTRL + C to quit)
        localstack_s3  | [2024-03-30 17:10:18 +0000] [53] [INFO] Running on http://0.0.0.0:48663 (CTRL + C to quit)
        localstack_s3  | 2024-03-30T17:10:18:INFO:hypercorn.error: Running on http://0.0.0.0:48663 (CTRL + C to quit)
        localstack_s3  | Waiting for all LocalStack services to be ready
        localstack_s3  | Waiting for all LocalStack services to be ready
        localstack_s3  | Waiting for all LocalStack services to be ready
        localstack_s3  | Ready.
        localstack_s3  | 2024-03-30T17:10:42:INFO:localstack.utils.analytics.profiler: Execution of "start_api_services" took 24646.23ms


</pre>

&nbsp;

Check.<br />
Response [localstack.http]
<pre>
    HTTP/1.1 200 
    content-type: application/json
    content-length: 170
    access-control-allow-origin: *
    access-control-allow-methods: HEAD,GET,PUT,POST,DELETE,OPTIONS,PATCH
    access-control-allow-headers: authorization,content-type,content-length,content-md5,cache-control,x-amz-content-sha256,x-amz-date,x-amz-security-token,x-amz-user-agent,x-amz-target,x-amz-acl,x-amz-version-id,x-localstack-target,x-amz-tagging
    access-control-expose-headers: x-amz-version-id
    date: Sat, 30 Mar 2024 17:11:51 GMT
    server: hypercorn-h11
    Connection: close

    {
    "services": {
        "lambda": "running",
        "logs": "running",
        "s3": "running",
        "cloudwatch": "running"
    },
    "features": {
        "persistence": "initialized",
        "initScripts": "initialized"
    }
    }

</pre>

&nbsp;

&nbsp;

## &#x1F530; TERRAFORM STAGES :

&nbsp;

<pre>
    ❯ cd &lt;folder-projects&gt;

    ❯ ls -lah
</pre>

&nbsp;

Create a single .tf file and fill it with the following script :
<pre>
    ❯ vim main.tf

        provider "aws" {
        region                      = "ap-southeast-3"
        access_key                  = "0"
        secret_key                  = "0"
        s3_use_path_style           = true
        skip_credentials_validation = true
        skip_metadata_api_check     = true
        skip_requesting_account_id  = true

        endpoints {
            s3 = "http://localhost:4566"
        }
        }

        resource "aws_s3_bucket" "b" {
        bucket = "muhammad-bucket-terraform"
        acl    = "public-read"
        }
</pre>

Start running the terraform stage.
<pre>
    ❯ terraform init

        Initializing the backend...

        Initializing provider plugins...
        - Finding latest version of hashicorp/aws...
        - Installing hashicorp/aws v5.43.0...
        - Installed hashicorp/aws v5.43.0 (signed by HashiCorp)

        Terraform has created a lock file .terraform.lock.hcl to record the provider
        selections it made above. Include this file in your version control repository
        so that Terraform can guarantee to make the same selections by default when
        you run "terraform init" in the future.

        Terraform has been successfully initialized!

        You may now begin working with Terraform. Try running "terraform plan" to see
        any changes that are required for your infrastructure. All Terraform commands
        should now work.

        If you ever set or change modules or backend configuration for Terraform,
        rerun this command to reinitialize your working directory. If you forget, other
        commands will detect it and remind you to do so if necessary.    
</pre>

<pre>
    ❯ terraform fmt
    ❯ terraform validate
        ╷
        │ Warning: Argument is deprecated
        │ 
        │   with aws_s3_bucket.b,
        │   on main.tf line 17, in resource "aws_s3_bucket" "b":
        │   17:   acl    = "public-read"
        │ 
        │ Use the aws_s3_bucket_acl resource instead
        ╵
        Success! The configuration is valid, but there were some validation warnings as shown above.
</pre>

<pre>
    ❯ terraform plan

        Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
        following symbols:
        + create

        Terraform will perform the following actions:

        # aws_s3_bucket.b will be created
        + resource "aws_s3_bucket" "b" {
            + acceleration_status         = (known after apply)
            + acl                         = "public-read"
            + arn                         = (known after apply)
            + bucket                      = "muhammad-bucket-terraform"
            + bucket_domain_name          = (known after apply)
            + bucket_prefix               = (known after apply)
            + bucket_regional_domain_name = (known after apply)
            + force_destroy               = false
            + hosted_zone_id              = (known after apply)
            + id                          = (known after apply)
            + object_lock_enabled         = (known after apply)
            + policy                      = (known after apply)
            + region                      = (known after apply)
            + request_payer               = (known after apply)
            + tags_all                    = (known after apply)
            + website_domain              = (known after apply)
            + website_endpoint            = (known after apply)
            }

        Plan: 1 to add, 0 to change, 0 to destroy.
        ╷
        │ Warning: AWS account ID not found for provider
        │ 
        │   with provider["registry.terraform.io/hashicorp/aws"],
        │   on main.tf line 1, in provider "aws":
        │    1: provider "aws" {
        │ 
        │ See https://registry.terraform.io/providers/hashicorp/aws/latest/docs#skip_requesting_account_id for implications.
        ╵
        ╷
        │ Warning: Argument is deprecated
        │ 
        │   with aws_s3_bucket.b,
        │   on main.tf line 17, in resource "aws_s3_bucket" "b":
        │   17:   acl    = "public-read"
        │ 
        │ Use the aws_s3_bucket_acl resource instead
        │ 
        │ (and one more similar warning elsewhere)
        ╵

        ──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

        Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you
        run "terraform apply" now.
</pre>

&nbsp;

If the stage plan is confirmed without errors, continue with the `apply` stage.
<pre>
    ❯ terraform apply

        Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
        following symbols:
        + create

        Terraform will perform the following actions:

        # aws_s3_bucket.b will be created
        + resource "aws_s3_bucket" "b" {
            + acceleration_status         = (known after apply)
            + acl                         = "public-read"
            + arn                         = (known after apply)
            + bucket                      = "muhammad-bucket-terraform"
            + bucket_domain_name          = (known after apply)
            + bucket_prefix               = (known after apply)
            + bucket_regional_domain_name = (known after apply)
            + force_destroy               = false
            + hosted_zone_id              = (known after apply)
            + id                          = (known after apply)
            + object_lock_enabled         = (known after apply)
            + policy                      = (known after apply)
            + region                      = (known after apply)
            + request_payer               = (known after apply)
            + tags_all                    = (known after apply)
            + website_domain              = (known after apply)
            + website_endpoint            = (known after apply)
            }

        Plan: 1 to add, 0 to change, 0 to destroy.
        ╷
        │ Warning: AWS account ID not found for provider
        │ 
        │   with provider["registry.terraform.io/hashicorp/aws"],
        │   on main.tf line 1, in provider "aws":
        │    1: provider "aws" {
        │ 
        │ See https://registry.terraform.io/providers/hashicorp/aws/latest/docs#skip_requesting_account_id for implications.
        ╵
        ╷
        │ Warning: Argument is deprecated
        │ 
        │   with aws_s3_bucket.b,
        │   on main.tf line 17, in resource "aws_s3_bucket" "b":
        │   17:   acl    = "public-read"
        │ 
        │ Use the aws_s3_bucket_acl resource instead
        │ 
        │ (and one more similar warning elsewhere)
        ╵

        Do you want to perform these actions?
        Terraform will perform the actions described above.
        Only 'yes' will be accepted to approve.

        Enter a value: [yes]



        aws_s3_bucket.b: Creating...
        aws_s3_bucket.b: Creation complete after 0s [id=muhammad-bucket-terraform]
        ╷
        │ Warning: AWS account ID not found for provider
        │ 
        │   with provider["registry.terraform.io/hashicorp/aws"],
        │   on main.tf line 1, in provider "aws":
        │    1: provider "aws" {
        │ 
        │ See https://registry.terraform.io/providers/hashicorp/aws/latest/docs#skip_requesting_account_id for implications.
        ╵
        ╷
        │ Warning: Argument is deprecated
        │ 
        │   with aws_s3_bucket.b,
        │   on main.tf line 17, in resource "aws_s3_bucket" "b":
        │   17:   acl    = "public-read"
        │ 
        │ Use the aws_s3_bucket_acl resource instead
        ╵

        Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
</pre>


Check the results of the infrastructure as Code from the terraform.<br />
List existing buckets of the running localstack container.
<pre>
    ❯ aws s3api list-buckets --endpoint "http://localhost:4566"
        {
            "Buckets": [
                {
                    "Name": "muhammad-bucket-terraform",
                    "CreationDate": "2024-03-31T10:34:37+00:00"
                }
            ],
            "Owner": {
                "DisplayName": "webfile",
                "ID": "75aa57f09aa0c8caeab4f8c24e99d10f8e7faeebf76c078efc7c6caea54ba06a"
            }
        }
</pre>

&nbsp;

Destroy as applied to previous returns.
<pre>
    ❯ terraform destroy

            aws_s3_bucket.b: Refreshing state... [id=muhammad-bucket-terraform]

            Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
            following symbols:
            - destroy

            Terraform will perform the following actions:

            # aws_s3_bucket.b will be destroyed
            - resource "aws_s3_bucket" "b" {
                - acl                         = "public-read" -> null
                - arn                         = "arn:aws:s3:::muhammad-bucket-terraform" -> null
                - bucket                      = "muhammad-bucket-terraform" -> null
                - bucket_domain_name          = "muhammad-bucket-terraform.s3.amazonaws.com" -> null
                - bucket_regional_domain_name = "muhammad-bucket-terraform.s3.ap-southeast-3.amazonaws.com" -> null
                - force_destroy               = false -> null
                - hosted_zone_id              = "Z01846753K324LI26A3VV" -> null
                - id                          = "muhammad-bucket-terraform" -> null
                - object_lock_enabled         = false -> null
                - region                      = "ap-southeast-3" -> null
                - request_payer               = "BucketOwner" -> null
                - tags                        = {} -> null
                - tags_all                    = {} -> null

                - grant {
                    - permissions = [
                        - "READ",
                        ] -> null
                    - type        = "Group" -> null
                    - uri         = "http://acs.amazonaws.com/groups/global/AllUsers" -> null
                    }
                - grant {
                    - id          = "75aa57f09aa0c8caeab4f8c24e99d10f8e7faeebf76c078efc7c6caea54ba06a" -> null
                    - permissions = [
                        - "FULL_CONTROL",
                        ] -> null
                    - type        = "CanonicalUser" -> null
                    }

                - server_side_encryption_configuration {
                    - rule {
                        - bucket_key_enabled = false -> null

                        - apply_server_side_encryption_by_default {
                            - sse_algorithm = "AES256" -> null
                            }
                        }
                    }

                - versioning {
                    - enabled    = false -> null
                    - mfa_delete = false -> null
                    }
                }

            Plan: 0 to add, 0 to change, 1 to destroy.
            ╷
            │ Warning: AWS account ID not found for provider
            │ 
            │   with provider["registry.terraform.io/hashicorp/aws"],
            │   on main.tf line 1, in provider "aws":
            │    1: provider "aws" {
            │ 
            │ See https://registry.terraform.io/providers/hashicorp/aws/latest/docs#skip_requesting_account_id for implications.
            ╵
            ╷
            │ Warning: Argument is deprecated
            │ 
            │   with aws_s3_bucket.b,
            │   on main.tf line 17, in resource "aws_s3_bucket" "b":
            │   17:   acl    = "public-read"
            │ 
            │ Use the aws_s3_bucket_acl resource instead
            ╵

            Do you really want to destroy all resources?
            Terraform will destroy all your managed infrastructure, as shown above.
            There is no undo. Only 'yes' will be accepted to confirm.

            Enter a value: yes

            aws_s3_bucket.b: Destroying... [id=muhammad-bucket-terraform]
            aws_s3_bucket.b: Destruction complete after 0s
            ╷
            │ Warning: AWS account ID not found for provider
            │ 
            │   with provider["registry.terraform.io/hashicorp/aws"],
            │   on main.tf line 1, in provider "aws":
            │    1: provider "aws" {
            │ 
            │ See https://registry.terraform.io/providers/hashicorp/aws/latest/docs#skip_requesting_account_id for implications.
            ╵

            Destroy complete! Resources: 1 destroyed.
</pre>

&nbsp;

Displays a list of buckets that exist on localstack.
<pre>
    ❯ aws s3api list-buckets --endpoint "http://localhost:4566"
    {
        "Buckets": [],
        "Owner": {
            "DisplayName": "webfile",
            "ID": "75aa57f09aa0c8caeab4f8c24e99d10f8e7faeebf76c078efc7c6caea54ba06a"
        }
    }
</pre>

&nbsp;

&nbsp;

&nbsp;

Restart the localstack:3.2 container so that the existing buckets are reset again. 
Previously informed that if the current localstack without LOCALSTACK_API_KEY then persistence cannot be applied.
<pre>
    ❯ docker-compose restart localstack
        [+] Running 1/1
        ⠿ Container localstack  Started  
</pre>

&nbsp;

Rechecks the bucket list on the localstack where buckets were previously formed.
<pre>
    ❯ aws s3api list-buckets --endpoint "http://localhost:4566"
    {
        "Buckets": [],
        "Owner": {
            "DisplayName": "webfile",
            "ID": "75aa57f09aa0c8caeab4f8c24e99d10f8e7faeebf76c078efc7c6caea54ba06a"
        }
    }
</pre>

&nbsp;

&nbsp;

&nbsp;

---

&nbsp;

<div align="center">
    <img src="./gambar-petunjuk/well_done.png" alt="well_done" style="display: block; margin: 0 auto;">
</div> 

&nbsp;

---

&nbsp;
