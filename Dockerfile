FROM quay.io/fedora/fedora-bootc@sha256:7b9740a9cbc86ce5050c4e13dca90055ca43f50548107074ccb62e5ebbd3d5f0

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
