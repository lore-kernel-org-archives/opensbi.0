From: Adnan Rahman Chowdhury <adnan.chowdhury@sifive.com>
Date: Thu, 30 Jun 2022 10:46:34 +0100
Subject: [PATCH v2 0/1] Added a blocking wait function that waits until a certain condition is satisfied or timeout occurs
Message-ID: <20220630094635.389645-1-adnan.chowdhury@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Motivation: Suppose a peripheral needs to be configured to transmit data.
There is an SFR bit which indicates that the peripheral is ready to transmit.
The firmware should check the bit and will only transmit data when the
peripheral is ready. When the firmware starts polling the SFR, the peripheral
could be busy transmitting/receiving other data so the firmware must wait
till that completes. Assuming that there is no other way, the firmware
shouldn't wait indefinitely.

This patch series addresses this problem. There is a new function that
constantly checks whether a certain condition is met and times out after a
certain amount of time.

Changes in v2:
  - Code refactored to make the implementation cleaner.
  - Added documentation for the API.

Adnan Rahman Chowdhury (1):
  lib: sbi_timer: Added a blocking wait function that waits until a
    certain condition is satisfied or timeout occurs

 include/sbi/sbi_timer.h | 18 ++++++++++++++++++
 lib/sbi/sbi_timer.c     | 13 +++++++++++++
 2 files changed, 31 insertions(+)

-- 
2.30.2


