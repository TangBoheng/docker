FROM elasticsearch:9.3.2

# 安装 IK 分词插件
RUN elasticsearch-plugin install --batch \
    https://github.com/infinilabs/analysis-ik/releases/download/v9.3.2/elasticsearch-analysis-ik-9.3.2.zip

# 安装拼音分词插件
RUN elasticsearch-plugin install --batch \
    https://github.com/medcl/elasticsearch-analysis-pinyin/releases/download/v9.3.2/elasticsearch-analysis-pinyin-9.3.2.zip

# 修复 IK 插件 entitlement 策略（ES 9.x 需要显式声明 files read 权限）
RUN printf 'ALL-UNNAMED:\n  - files:\n    - path: /usr/share/elasticsearch/config/analysis-ik\n      mode: read\n    - path: /usr/share/elasticsearch/plugins/analysis-ik\n      mode: read\n  - outbound_network\n' \
    > /usr/share/elasticsearch/plugins/analysis-ik/entitlement-policy.yaml

# 创建 IK 自定义词典目录
RUN mkdir -p /usr/share/elasticsearch/config/analysis-ik

# 写入自定义词典 traveling_tag.dic（traveling_tag 字段整词保留不分词）
RUN printf '历史古迹\n自然风光\n主题乐园\n城市景观\n经典必去\n小众秘境\n老人\n亲子\n情侣\n朋友\n奢华\n美景\n当地风情\n设计感\n精品民宿\n温泉泡汤\n度假农庄\n美食\n豪华\n高档\n' \
    > /usr/share/elasticsearch/config/analysis-ik/traveling_tag.dic

# 写入 IK 配置文件，引用自定义词典
RUN printf '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE properties SYSTEM "http://java.sun.com/dtd/properties.dtd">\n<properties>\n    <comment>IK Analyzer extended configuration</comment>\n    <entry key="ext_dict">traveling_tag.dic</entry>\n</properties>\n' \
    > /usr/share/elasticsearch/config/analysis-ik/IKAnalyzer.cfg.xml
