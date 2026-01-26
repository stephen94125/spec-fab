function spec_learn --description "Update Master Indices (Summary Spec & Plan)"
    set -l current_branch (git branch --show-current)
    if test -z "$current_branch"; echo "❌ Not in a git repo."; return 1; end

    echo "🧠 Consolidating memory from feature: $current_branch..."

    # 1. Prepare paths
    set -l feature_dir "specs/$current_branch"
    set -l spec_index ".specify/memory/spec-index.md"
    set -l plan_index ".specify/memory/plan-index.md"
    
    # 2. Ask for user insights (This is the most valuable Input)
    echo "🎤 Any strategic/tech lessons learned? (Press Enter to skip)"
    read -P "> " user_lessons

    # ---------------------------------------------------------
    # Phase 1: Summary Spec (Updating Product Brain)
    # ---------------------------------------------------------
    echo "📘 Updating Product Index (spec-index.md)..."
    
    set -l spec_context "
=== CURRENT_INDEX ===
$(cat $spec_index)

=== NEW_FEATURE_SPEC ===
$(cat $feature_dir/spec.md)

=== USER_FEEDBACK ===
$user_lessons
"
    # Use summary_spec pattern
    echo "$spec_context" | fabric -p summary_spec > "$spec_index.new"
    
    if test -s "$spec_index.new"
        mv "$spec_index.new" "$spec_index"
        echo "✅ spec-index.md updated."
    else
        echo "⚠️  Failed to update spec-index.md"
    end

    # ---------------------------------------------------------
    # Phase 2: Summary Plan (Updating Tech Brain)
    # ---------------------------------------------------------
    echo "📙 Updating Tech Index (plan-index.md)..."
    
    set -l plan_context "
=== CURRENT_INDEX ===
$(cat $plan_index)

=== NEW_FEATURE_PLAN ===
$(cat $feature_dir/plan.md)

=== USER_LESSONS ===
$user_lessons
"
    # Use summary_plan pattern
    echo "$plan_context" | fabric -p summary_plan > "$plan_index.new"

    if test -s "$plan_index.new"
        mv "$plan_index.new" "$plan_index"
        echo "✅ plan-index.md updated."
    else
        echo "⚠️  Failed to update plan-index.md"
    end

    # ---------------------------------------------------------
    # Final Review
    # ---------------------------------------------------------
    echo "🎉 Memory consolidation complete!"
    echo "   Opening Master Indices for review..."
    
    if type -q nvim
        nvim -p "$spec_index" "$plan_index"
    else
        vim -p "$spec_index" "$plan_index"
    end
end
