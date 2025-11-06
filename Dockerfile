FROM quay.io/fedora/fedora-bootc@sha256:930f897721b986b7004eb8bf8b61ba5158959ab78abbc06deaf1917037dbc637

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
