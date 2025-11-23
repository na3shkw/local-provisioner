# local-provisioner

[![ansible-lint](https://github.com/na3shkw/local-provisioner/actions/workflows/ansible-lint.yaml/badge.svg)](https://github.com/na3shkw/local-provisioner/actions/workflows/ansible-lint.yaml)

ローカルの環境構築を自動化・永続化するためのリポジトリ。

## 実行方法

1. 必要なAnsibleコレクションをインストールします。
    ```bash
    ansible-galaxy collection install -r requirements.yaml
    ```
2. dry-runモードで実行して変更内容を確認します。
    ```bash
    ansible-playbook ansible/playbooks/wsl-ubuntu.yaml --check
    ```
3. 問題がなければ実際に実行します。
    ```bash
    ansible-playbook ansible/playbooks/wsl-ubuntu.yaml
    ```
