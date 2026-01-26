function spec_tasks --description "Generate Actionable Tasks from Plan (SpecFab Flow)"
    # 1. Automatically detect environment
    set -l current_branch (git branch --show-current)
    if test -z "$current_branch"; echo "❌ Error: Not in a git repo."; return 1; end

    set -l feature_dir "specs/$current_branch"
    set -l plan_file "$feature_dir/plan.md"
    set -l tasks_file "$feature_dir/tasks.md"
    set -l constitution_file ".specify/memory/constitution.md"

    # 2. Check if Plan exists (cannot break down tasks without a Plan)
    if not test -f "$plan_file"
        echo "❌ Error: Plan file not found at $plan_file"
        echo "   Run 'spec_plan' first."
        return 1
    end

    echo "📋 Breaking down Plan into Tasks for: $current_branch"

    # 3. Assemble Context
    set -l context "
=== CONSTITUTION ===
$(cat $constitution_file)

=== TECHNICAL_PLAN ===
$(cat $plan_file)
"

    # 4. Call Fabric
    set -l task_content (echo "$context" | fabric -p create_tasks_from_plan)

    if test -z "$task_content"
        echo "❌ Error: AI failed to generate tasks."
        return 1
    end

    # 5. Save and open file
    echo "$task_content" > "$tasks_file"
    echo "✅ Tasks generated at: $tasks_file"
    
    if type -q nvim; nvim "$tasks_file"; else; vim "$tasks_file"; end
end
