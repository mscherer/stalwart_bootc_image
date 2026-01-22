FROM quay.io/fedora/fedora-bootc@sha256:673848a0e9775f16fb059144122a9866ac8fa69599afe55b60c0ec2946384bb6

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
