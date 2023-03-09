# tripleo-templates-jp
tripleo templates for ML2/OVN, ML2/OVS

実行環境などはhowtocreate_localcloud.txtという怪文書にまとめました。

VMware Workstation 17 playerで3台分のVMを使ってtripleoを使ってopenstackをインストールして動かそうという試みです。

2パターンの設定ファイルを作成しました
- ML2/OVNはstack/for_ovn
- ML2/OVSはstack/for_ovs
下記のような感じで丸ごと落として/home/stack直下に配置してください
```
git clone https://github.com/frsk9999/tripleo-templates-jp
cp -r tripleo-templates-jp/stack/for_ovs/* /home/stack/.
   or
cp -r tripleo-templates-jp/stack/for_ovn/* /home/stack/.
```

大まかな設定の解説(共通)
```
for_xxx/ovs-ofctlの結果 : 今後の解説に使おうと思って取得した今回の目的となるファイル(openflowがどう追加されるか)
for_xxx/custom-undercloud-params.yaml : デバグ用
for_xxx/deploy_overcloud.sh : デプロイ時に使うためのスクリプト(openstack overcloud deployを実行するためのスクリプト)
for_xxx/instackenv.json : controller,computeのbaremetalノードへの登録のためのファイル(MACアドレスの書き換えが必要です)
for_xxx/test.sh : ansibleがpython3.11でインストールされて後のエラーの原因になるので、pipで3.9をインストールして置き換えるためのスクリプト
for_xxx/undercloud.conf :アンダークラウド作成のための設定ファイル(デバグ用のyamlを呼び出す)
for_xxx/templates/Compute-net.yaml : computeのNIC構成ファイル
for_xxx/templates/Controller-net.yaml : controllerのNIC構成ファイル
for_xxx/templates/custom.yaml: カスタマイズ用のファイル(ML2等)
for_xxx/templates/debug.yaml : オーバークラウドデバグ用(未使用)
for_xxx/templates/hostname-map.yaml : ホスト名のマッピングファイル(未使用)
for_xxx/templates/ips-from-pool-all.yaml : ipアドレスの設定ファイル
for_xxx/templates/network_data.yaml : ネットワーク設定ファイル
for_xxx/templates/overcloud-baremetal-deploy.yaml : オーバークラウド上に作るノードの個数などの設定ファイル
for_xxx/templates/roles_data.yaml : 各ノードの設定ファイル
for_xxx/templates/scheduler_hints_env.yaml : 各ノードの命名規則の設定ファイル
for_xxx/templates/vip-data.yaml : VIP(virtual ip)の設定ファイル
for_xxx/templates/nics配下 : 使おうとしてやめたファイル
```

いきなりOVNが作ったOpenFlowを読もうとするとレジスタで混乱して詰みやすいので、
openvswitch(ovs)用である程度慣れてから読もうとすれば多少はましかも(こちらでもレジスタは使ってるけどそこまでひどくないので最初に読むにはいいのかなと)
