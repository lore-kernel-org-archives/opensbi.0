From: Ben Dooks <ben.dooks@codethink.co.uk>
Date: Mon,  2 Dec 2024 11:03:32 +0000
Subject: [RFC 1/5] add build container for ubunti 18.04
In-Reply-To: <20241202110336.332490-1-ben.dooks@codethink.co.uk>
References: <20241202110336.332490-1-ben.dooks@codethink.co.uk>
Message-ID: <20241202110336.332490-2-ben.dooks@codethink.co.uk>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a podman/docker container for Ubuntu 18.04 for
build testing on older systems which might not have
the same support as a developer has.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 containers/ubuntu_1804/Containerfile | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 containers/ubuntu_1804/Containerfile

diff --git a/containers/ubuntu_1804/Containerfile b/containers/ubuntu_1804/Containerfile
new file mode 100644
index 0000000..c2279db
--- /dev/null
+++ b/containers/ubuntu_1804/Containerfile
@@ -0,0 +1,4 @@
+FROM ubuntu:18.04
+
+RUN apt-get update && apt-get install build-essential gcc-riscv64-linux-gnu -y
+
-- 
2.37.2.352.g3c44437643


