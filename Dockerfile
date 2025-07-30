FROM quay.io/fedora/fedora-bootc@sha256:c4b79090be7709e35f967447693f006ad0d156c23c73cb6a59483e2e1781e1b9

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
