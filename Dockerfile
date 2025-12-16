FROM quay.io/fedora/fedora-bootc@sha256:89182a4b3186bdaee396c882f4ddc313a1519361922ebb0f959483fa5e0d24b5

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
