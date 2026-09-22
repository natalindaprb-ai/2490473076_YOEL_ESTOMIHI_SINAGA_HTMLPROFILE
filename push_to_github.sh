#!/usr/bin/env bash

set -e

# ============================================================
# Push proyek Yoel ke GitHub
# ============================================================

REPO_DIR="/c/Users/YOEL/Downloads/2490473076_YOEL_ESTOMIHI_SINAGA_HTMLPROFILE_V2/2490473076_YOEL_ESTOMIHI_SINAGA_HTMLPROFILE"
REMOTE_URL="https://github.com/natalindaprb-ai/2490473076_YOEL_ESTOMIHI_SINAGA_HTMLPROFILE.git"
BRANCH="main"
COMMIT_MESSAGE="Update website Yoel"

echo "=============================================="
echo "  GIT PUSH - YOEL HTML PROFILE"
echo "=============================================="

# Cek Git
if ! command -v git >/dev/null 2>&1; then
    echo "ERROR: Git tidak ditemukan."
    exit 1
fi

# Cek folder proyek
if [ ! -d "$REPO_DIR" ]; then
    echo "ERROR: Folder proyek tidak ditemukan:"
    echo "$REPO_DIR"
    exit 1
fi

cd "$REPO_DIR"

echo ""
echo "[1/6] Folder proyek:"
pwd

echo ""
echo "[2/6] Memastikan repository Git..."
if [ ! -d ".git" ]; then
    git init
fi

echo ""
echo "[3/6] Menyiapkan remote origin..."
if git remote get-url origin >/dev/null 2>&1; then
    git remote set-url origin "$REMOTE_URL"
else
    git remote add origin "$REMOTE_URL"
fi

echo "Remote:"
git remote -v

echo ""
echo "[4/6] Memastikan branch $BRANCH..."
git branch -M "$BRANCH"

echo ""
echo "[5/6] Menambahkan dan commit perubahan..."
git add .

if git diff --cached --quiet; then
    echo "Tidak ada perubahan baru untuk di-commit."
else
    git commit -m "$COMMIT_MESSAGE"
fi

echo ""
echo "[6/6] Push ke GitHub..."
git push -u origin "$BRANCH"

echo ""
echo "=============================================="
echo "  PUSH BERHASIL"
echo "=============================================="
echo "Repository:"
echo "$REMOTE_URL"
echo "Branch:"
echo "$BRANCH"
echo ""
echo "Website/proyek sudah dikirim ke GitHub."
