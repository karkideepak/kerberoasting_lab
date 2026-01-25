Kerberoasting – Attack Flow Overview

Kerberoasting is a post-exploitation technique used in Windows Active Directory environments to extract and crack service account credentials by abusing legitimate Kerberos functionality.

This README provides a high-level conceptual flow of the attack for learning, defense, and threat-modeling purposes.

What is Kerberoasting?

Kerberoasting targets service accounts that have Service Principal Names (SPNs) registered in Active Directory.

Any authenticated domain user can request a Kerberos service ticket (TGS) for these services.
That ticket is encrypted using the service account’s password hash, which can be cracked offline.

Kerberoasting Flow Diagram
┌──────────────────────────┐
│  Attacker                │
│  (Any domain user)       │
└───────────┬──────────────┘
            │
            │ 1. Requests service access
            │    (Kerberos TGS request)
            ▼
┌──────────────────────────┐
│  Domain Controller (DC)  │
│  Kerberos KDC            │
└───────────┬──────────────┘
            │
            │ 2. Issues Service Ticket (TGS)
            │    encrypted with
            │    service account password hash
            ▼
┌──────────────────────────┐
│  Encrypted Service Ticket│
│  (TGS)                   │
└───────────┬──────────────┘
            │
            │ 3. Ticket is extracted
            │    (legitimate behavior)
            ▼
┌──────────────────────────┐
│  Offline Password Crack  │
│  (No domain interaction) │
└───────────┬──────────────┘
            │
            │ 4. Password recovered
            ▼
┌──────────────────────────┐
│  Compromised Service     │
│  Account                 │
└───────────┬──────────────┘
            │
            │ 5. Lateral movement /
            │    privilege escalation
            ▼
┌──────────────────────────┐
│  Higher Privileges       │
│  (Potential Domain Admin)│
└──────────────────────────┘

Why Kerberoasting Works

Requesting service tickets is normal Kerberos behavior

Service account passwords are often:

Long-lived

Rarely rotated

Human-generated

Ticket cracking happens offline, outside defender visibility

Common Impact

Compromise of service accounts

Lateral movement across servers

Privilege escalation

Full domain compromise in poorly segmented environments

Defensive Mitigations

Recommended protections:

Use Group Managed Service Accounts (gMSA)

Enforce long, random service account passwords

Rotate service account credentials regularly

Apply least privilege to service accounts

Monitor for:

Unusual volumes of TGS requests

Service ticket requests from non-service hosts

Detection Notes

Kerberoasting is difficult to detect because:

The attack uses valid credentials

Ticket requests are expected Kerberos behavior

Password cracking occurs offline

Detection usually relies on behavioral baselining and correlation, not single alerts.
