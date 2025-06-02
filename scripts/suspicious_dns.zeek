@load base/protocols/dns
@load base/frameworks/notice

module MyZeek;

redef enum Notice::Type += {
    Suspicious_DNS
};

event dns_request(c: connection, msg: dns_msg, query: string, qtype: count, qclass: count)
{
    if (|query| > 30)
    {
        print fmt("Suspicious DNS query detected: %s from %s", query, c$id$orig_h);
        NOTICE([$note=MyZeek::Suspicious_DNS,
                $msg=fmt("Long DNS query: %s from %s", query, c$id$orig_h),
                $conn=c]);
    }
}
