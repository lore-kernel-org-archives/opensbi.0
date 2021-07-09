From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Fri,  9 Jul 2021 20:34:20 +0100
Subject: [PATCH v4 2/5] fw_base: Put data in .data rather than .text
In-Reply-To: <20210709193423.29712-1-jrtc27@jrtc27.com>
References: <20210709193423.29712-1-jrtc27@jrtc27.com>
Message-ID: <20210709193423.29712-3-jrtc27@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The -N linker option is supposed to make .text writable, but GNU ld and
LLD differ in interpreting what that means. GNU ld will happily let you
have relocations in it, but LLD will see that the input section is
read-only (even though the output section is writable) and give an
error. It's unclear if either of them intend to have that behaviour in
this edge case, but regardless there's no reason not to just put the
data in a writable .data section.
---
 firmware/fw_base.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index ee2a51b..f8aea05 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -501,6 +501,7 @@ _skip_trap_exit_rv32_hyp:
 	/* We don't expect to reach here hence just hang */
 	j	_start_hang
 
+	.data
 	.align 3
 #ifdef FW_PIC
 _runtime_offset:
-- 
2.31.0


