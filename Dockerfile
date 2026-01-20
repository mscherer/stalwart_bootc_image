FROM quay.io/fedora/fedora-bootc@sha256:d3e4bdec2ae93436922db83a29030a9dddfb15dea6ddb9d90a17381af25f43e4

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
