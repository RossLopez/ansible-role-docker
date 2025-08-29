#!/usr/bin/env bash
set -euo pipefail

echo "🧪 Running Ansible Role Tests"
echo "============================="

# Use virtual environment tools
VENV_PATH="/Users/ross/github_repos/ansible-role-docker/.venv/bin"

# Test 1: YAML Syntax (exclude venv and external packages)
echo "📝 Testing YAML syntax..."
$VENV_PATH/yamllint --config-file=.yamllint . || echo "❌ YAML linting failed"

# Test 2: Ansible Syntax  
echo "📋 Testing Ansible syntax..."
$VENV_PATH/ansible-lint . || echo "❌ Ansible linting failed"

echo "✅ Basic syntax checks completed!"
echo ""
echo "💡 To run full integration tests with Docker:"
echo "   1. Start Docker Desktop"  
echo "   2. Run: molecule test"
