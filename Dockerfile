FROM quay.io/fedora/fedora-bootc@sha256:abff94d129bd013862fb63a3ce11270150cfef762af9a0b286bc1b6772a38ed6

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
