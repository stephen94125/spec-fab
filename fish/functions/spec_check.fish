function spec_check --description "Generate QA Checklist from Spec & Plan (SpecFab Flow)"
    set -l current_branch (git branch --show-current)
    if test -z "$current_branch"; echo "❌ Error: Not in a git repo."; return 1; end

    set -l feature_dir "specs/$current_branch"
    set -l spec_file "$feature_dir/spec.md"
    set -l plan_file "$feature_dir/plan.md"
    set -l checklist_file "$feature_dir/checklist.md"

    # This time we need both the Spec and the Plan to exist
    if not test -f "$spec_file"; echo "❌ Error: Spec not found."; return 1; end
    if not test -f "$plan_file"; echo "❌ Error: Plan not found."; return 1; end

    echo "🛡️  Generating QA Checklist for: $current_branch"

    set -l context "
=== FEATURE_SPEC ===
$(cat $spec_file)

=== TECHNICAL_PLAN ===
$(cat $plan_file)
"

    set -l check_content (echo "$context" | fabric -p create_qa_checklist)

    if test -z "$check_content"
        echo "❌ Error: AI failed to generate checklist."
        return 1
    end

    echo "$check_content" > "$checklist_file"
    echo "✅ Checklist generated at: $checklist_file"
    
    if type -q nvim; nvim "$checklist_file"; else; vim "$checklist_file"; end
end
