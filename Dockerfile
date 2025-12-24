FROM quay.io/fedora/fedora-bootc@sha256:e9603198c12316fb7da5d2f46bdc7773d874a371848691ddf68072faeaf3b399

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
