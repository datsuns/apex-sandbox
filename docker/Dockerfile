
# ---- Base: Ubuntu 22.04 (ROS/開発で相性が良い) ----
FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

# 基本ツール + Bazel 用 JDK + Python/venv + pkg-config
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates curl git unzip \
    build-essential pkg-config \
    python3 python3-venv python3-pip \
    openjdk-17-jdk-headless \
    vim tig \
 && rm -rf /var/lib/apt/lists/*

# Bazelisk を bazel として導入（プロジェクトの .bazelversion に追従）
RUN curl -L https://github.com/bazelbuild/bazelisk/releases/latest/download/bazelisk-linux-amd64 \
      -o /usr/local/bin/bazel \
 && chmod +x /usr/local/bin/bazel

# 開発ユーザー（root だとファイル権限で詰まりやすい）
RUN useradd -m -s /bin/bash dev
USER dev
WORKDIR /home/dev/work

# rules_ros を取得
RUN git clone https://github.com/ApexAI/rules_ros.git
WORKDIR /home/dev/work/rules_ros

# Python 仮想環境を用意（インストーラが pip を使うため隔離しておく）
RUN python3 -m venv .venv \
 && . .venv/bin/activate \
 && python -m pip install -U pip wheel packaging \
 && echo 'source /home/dev/work/rules_ros/.venv/bin/activate' >> ~/.bashrc

# venv をデフォルト PATH に前置（非対話実行でも venv の python/pip が使われる）
ENV PATH="/home/dev/work/rules_ros/.venv/bin:${PATH}"

# ここで一度モジュール解決だけ走らせてキャッシュしておく（任意）
# RUN bazel mod graph

# コンテナ起動時はリポジトリ直下でシェル
WORKDIR /home/dev/work/rules_ros
CMD ["/bin/bash"]
