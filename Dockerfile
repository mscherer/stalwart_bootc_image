FROM quay.io/fedora/fedora-bootc@sha256:8a9f80273d499de2ddc4dff445a3ab4a296ef0d0f21399e7a36ef42f62c63b23

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
