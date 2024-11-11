From: Samuel Holland <samuel.holland@sifive.com>
Date: Mon, 11 Nov 2024 14:02:48 -0800
Subject: [PATCH v2 04/11] scripts/carray.sh: Allow referencing a struct member
In-Reply-To: <20241111220304.1228821-1-samuel.holland@sifive.com>
References: <20241111220304.1228821-1-samuel.holland@sifive.com>
Message-ID: <20241111220304.1228821-5-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

It can be useful to embed the objects referenced by a carray inside
another struct. To avoid type punning, the generated carray code must
use the correct type for the enclosing struct and member access to
compute the desired object address.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - New patch for v2

 scripts/carray.sh | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/scripts/carray.sh b/scripts/carray.sh
index 16c6c136..fb985c86 100755
--- a/scripts/carray.sh
+++ b/scripts/carray.sh
@@ -61,6 +61,13 @@ if [ -z "${ARRAY_NAME}" ]; then
 	usage
 fi
 
+MEMBER_NAME=$(awk '{ if ($1 == "MEMBER-NAME:") { printf $2; exit 0; } }' "${CONFIG_FILE}")
+MEMBER_TYPE=$(awk '{ if ($1 == "MEMBER-TYPE:") { printf $2; for (i=3; i<=NF; i++) printf " %s", $i; exit 0; } }' "${CONFIG_FILE}")
+if [ -n "${MEMBER_NAME}" ] && [ -z "${MEMBER_TYPE}" ]; then
+	echo "Must specify MEMBER-TYPE: when using MEMBER-NAME:"
+	usage
+fi
+
 printf "// Generated with $(basename $0) from $(basename ${CONFIG_FILE})\n"
 printf "#include <%s>\n\n" "${TYPE_HEADER}"
 
@@ -69,9 +76,9 @@ for VAR in ${VAR_LIST}; do
 done
 printf "\n"
 
-printf "%s *const %s[] = {\n" "${TYPE_NAME}" "${ARRAY_NAME}"
+printf "%s *const %s[] = {\n" "${MEMBER_TYPE:-${TYPE_NAME}}" "${ARRAY_NAME}"
 for VAR in ${VAR_LIST}; do
-	printf "\t&%s,\n" "${VAR}"
+	printf "\t&%s,\n" "${VAR}${MEMBER_NAME:+.}${MEMBER_NAME}"
 done
 	printf "\tNULL\n"
 printf "};\n"
-- 
2.45.1


