FROM mcr.microsoft.com/devcontainers/java:1-17-bookworm

# The base image currently contains a Yarn APT source whose expired/missing
# signing key prevents Dev Container features from running apt-get update.
# OpenClinica does not use Yarn, so remove that repository before features run.
RUN rm -f /etc/apt/sources.list.d/yarn.list
