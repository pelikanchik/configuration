# creates a var file with common values for
# both deployment and provisioning
cat << EOF > $extra_vars
---
ansible_ssh_private_key_file: /var/lib/jenkins/${keypair}.pem
EDXAPP_PREVIEW_LMS_BASE: preview.${deploy_host}
EDXAPP_LMS_BASE: ${deploy_host}
EDXAPP_LMS_NGINX_PORT: 80
EDXAPP_LMS_PREVIEW_NGINX_PORT: 80
EDXAPP_CMS_NGINX_PORT: 80
COMMON_PYPI_MIRROR_URL: 'https://pypi.edx.org/root/pypi/+simple/'
COMMON_GIT_MIRROR: 'git.edx.org'
XSERVER_GRADER_DIR: "{{ xserver_data_dir }}/data/content-mit-600x~2012_Fall"
XSERVER_GRADER_SOURCE: "git@github.com:/MITx/6.00x.git"
XSERVER_LOCAL_GIT_IDENTITY: /var/lib/jenkins/git-identity-edx-pull
CERTS_LOCAL_GIT_IDENTITY: /var/lib/jenkins/git-identity-edx-pull
CERTS_AWS_KEY: $(cat /var/lib/jenkins/certs-aws-key)
CERTS_AWS_ID: $(cat /var/lib/jenkins/certs-aws-id) 
CERTS_BUCKET: "verify-test.edx.org"
migrate_db: "yes"
openid_workaround: True
edx_platform_commit: $edxapp_version
forum_version: $forum_version
xqueue_version: $xqueue_version
xserver_version: $xserver_version
ora_version: $ora_version
ease_version: $ease_version
certs_version: $certs_version
discern_version: $discern_version

rabbitmq_ip: "127.0.0.1"
rabbitmq_refresh: True
COMMON_HOSTNAME: edx-server
EDXAPP_STATIC_URL_BASE: $static_url_base

# Settings for Grade downloads
EDXAPP_GRADE_STORAGE_TYPE: 's3'
EDXAPP_GRADE_BUCKET: 'edx-grades'
EDXAPP_GRADE_ROOT_PATH: 'sandbox'

EOF
