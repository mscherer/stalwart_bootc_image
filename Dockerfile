FROM quay.io/fedora/fedora-bootc@sha256:167b4a0f811a4fe46c19998f2181340dd514aba961aebe8d973b42d7b195645e

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
