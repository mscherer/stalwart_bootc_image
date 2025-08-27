FROM quay.io/fedora/fedora-bootc@sha256:a48978ca7e1b872f14eeddcff0033047918c093e5994a2a4eacc81fb8918b20f

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
