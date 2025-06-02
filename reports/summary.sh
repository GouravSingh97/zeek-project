#!/bin/bash
echo "Network Traffic Summary - $(date)"
echo "----------------------"
echo "Total Connections:"
cat /home/kali/zeek-project/logs/conn.log | wc -l
echo "Top 5 Source IPs:"
zeek-cut id.orig_h < /home/kali/zeek-project/logs/conn.log | sort | uniq -c | sort -nr | head -5
echo "Top 5 DNS Queries:"
zeek-cut query < /home/kali/zeek-project/logs/dns.log | sort | uniq -c | sort -nr | head -5
echo "Suspicious Notices:"
cat /home/kali/zeek-project/logs/notice.log | tail -5
echo "Packet Loss Rate:"
zeek-cut ts percent_lost < /home/kali/zeek-project/logs/capture_loss.log | tail -5
