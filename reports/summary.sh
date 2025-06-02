#!/bin/bash
echo "Network Traffic Summary - $(date)"
echo "----------------------"
echo "Total Connections:"
cat /home/futureweapon/zeek-project/logs/conn.log | wc -l
echo "Top 5 Source IPs:"
zeek-cut id.orig_h < /home/futureweapon/zeek-project/logs/conn.log | sort | uniq -c | sort -nr | head -5
echo "Top 5 DNS Queries:"
zeek-cut query < /home/futureweapon/zeek-project/logs/dns.log | sort | uniq -c | sort -nr | head -5
echo "Suspicious Notices:"
cat /home/futureweapon/zeek-project/logs/notice.log | tail -5
echo "Packet Loss Rate:"
zeek-cut ts percent_lost < /home/futureweapon/zeek-project/logs/capture_loss.log | tail -5
