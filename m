From: Anup Patel <anup@brainfault.org>
Date: Sun, 23 Mar 2025 21:18:53 +0530
Subject: [PATCH] scripts: Fix firmware binaries compilation in create-binary-archive.sh
In-Reply-To: <20250220054623.1002666-1-apatel@ventanamicro.com>
References: <20250220054623.1002666-1-apatel@ventanamicro.com>
Message-ID: <CAAhSdy1xdaSWYQ-=t0e0BRfMmJq=VppmXU1Avzu3OdsXeivr_Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 20, 2025 at 11:16?AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Currently, the generic libsbi.a is compiled in create-binary-archive.sh
> before platform specific firmwares so a libsbi.a without any SBI extension
> gets linked to the platform specific firmwares. To address this, remove
> the temporary build directory in create-binary-archive.sh before using it.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Applied this patch to the riscv/opensbi repo.

Regards,
Anup

> ---
>  scripts/create-binary-archive.sh | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/create-binary-archive.sh b/scripts/create-binary-archive.sh
> index 9d56f2f4..73bdef21 100755
> --- a/scripts/create-binary-archive.sh
> +++ b/scripts/create-binary-archive.sh
> @@ -112,11 +112,12 @@ build_opensbi() {
>         esac
>
>         # Ensure output directory is present
> -       mkdir -p "${BUILD_OUTPUT_PATH}/${BUILD_NAME}"
> +       mkdir -p "${BUILD_OUTPUT_PATH}"
>
>         # Build and install generic library
>         echo "Build and install generic library XLEN=${BUILD_RISCV_XLEN}"
>         echo ""
> +       rm -rf "${BUILD_OUTPUT_PATH}/${BUILD_NAME}"
>         make -C "${BUILD_OPENSBI_SOURCE_PATH}" O="${BUILD_OUTPUT_PATH}/${BUILD_NAME}" I="${BUILD_OUTPUT_PATH}/${BUILD_ARCHIVE_NAME}" PLATFORM_RISCV_XLEN="${BUILD_RISCV_XLEN}" install_libsbi -j "${BUILD_NUM_THREADS}"
>         echo ""
>
> @@ -125,6 +126,7 @@ build_opensbi() {
>         do
>                 echo "Build and install PLATFORM=${BUILD_PLATFORM_SUBDIR[${INDEX}]} XLEN=${BUILD_RISCV_XLEN}"
>                 echo ""
> +               rm -rf "${BUILD_OUTPUT_PATH}/${BUILD_NAME}"
>                 make -C "${BUILD_OPENSBI_SOURCE_PATH}" O="${BUILD_OUTPUT_PATH}/${BUILD_NAME}" I="${BUILD_OUTPUT_PATH}/${BUILD_ARCHIVE_NAME}" PLATFORM="${BUILD_PLATFORM_SUBDIR[${INDEX}]}" PLATFORM_RISCV_XLEN="${BUILD_RISCV_XLEN}" install_libplatsbi install_firmwares -j "${BUILD_NUM_THREADS}"
>                 echo ""
>         done
> @@ -133,6 +135,7 @@ build_opensbi() {
>         if [ "${BUILD_DOCS}" == "yes" ]; then
>                 echo "Build and install docs"
>                 echo ""
> +               rm -rf "${BUILD_OUTPUT_PATH}/${BUILD_NAME}"
>                 make -C "${BUILD_OPENSBI_SOURCE_PATH}" O="${BUILD_OUTPUT_PATH}/${BUILD_NAME}" I="${BUILD_OUTPUT_PATH}/${BUILD_ARCHIVE_NAME}" install_docs
>                 echo ""
>         fi
> --
> 2.43.0
>

