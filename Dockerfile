FROM quay.io/fedora/fedora-bootc@sha256:a7e73d92d4c3d635ea66b9473ec531d6eed43fdeba83be7d32cf76b8dc7ec9e7

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
