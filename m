From: Samuel Holland <samuel.holland@sifive.com>
Date: Mon, 11 Nov 2024 14:02:47 -0800
Subject: [PATCH v2 03/11] scripts/carray.sh: Avoid useless use of cat
In-Reply-To: <20241111220304.1228821-1-samuel.holland@sifive.com>
References: <20241111220304.1228821-1-samuel.holland@sifive.com>
Message-ID: <20241111220304.1228821-4-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

awk(1) takes input files as positional arguments, so there is no need
to read the file with cat(1).

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - New patch for v2

 scripts/carray.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/carray.sh b/scripts/carray.sh
index 72808697..16c6c136 100755
--- a/scripts/carray.sh
+++ b/scripts/carray.sh
@@ -43,19 +43,19 @@ if [ ! -f "${CONFIG_FILE}" ]; then
 	usage
 fi
 
-TYPE_HEADER=`cat ${CONFIG_FILE} | awk '{ if ($1 == "HEADER:") { printf $2; exit 0; } }'`
+TYPE_HEADER=$(awk '{ if ($1 == "HEADER:") { printf $2; exit 0; } }' "${CONFIG_FILE}")
 if [ -z "${TYPE_HEADER}" ]; then
 	echo "Must specify HEADER: in input config file"
 	usage
 fi
 
-TYPE_NAME=`cat ${CONFIG_FILE} | awk '{ if ($1 == "TYPE:") { printf $2; for (i=3; i<=NF; i++) printf " %s", $i; exit 0; } }'`
+TYPE_NAME=$(awk '{ if ($1 == "TYPE:") { printf $2; for (i=3; i<=NF; i++) printf " %s", $i; exit 0; } }' "${CONFIG_FILE}")
 if [ -z "${TYPE_NAME}" ]; then
 	echo "Must specify TYPE: in input config file"
 	usage
 fi
 
-ARRAY_NAME=`cat ${CONFIG_FILE} | awk '{ if ($1 == "NAME:") { printf $2; exit 0; } }'`
+ARRAY_NAME=$(awk '{ if ($1 == "NAME:") { printf $2; exit 0; } }' "${CONFIG_FILE}")
 if [ -z "${ARRAY_NAME}" ]; then
 	echo "Must specify NAME: in input config file"
 	usage
-- 
2.45.1


