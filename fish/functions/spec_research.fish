function spec_research --description "Generate Research Report (SpecFab Flow)"
    set -l current_branch (git branch --show-current)
    if test -z "$current_branch"; echo "❌ Not in a git repo."; return 1; end

    set -l feature_dir "specs/$current_branch"
    set -l spec_file "$feature_dir/spec.md"
    set -l research_file "$feature_dir/research.md"
    set -l constitution_file ".specify/memory/constitution.md"

    if not test -f "$spec_file"; echo "❌ Spec not found."; return 1; end

    echo "🕵️  Performing Deep Research for: $current_branch"

    set -l context "
=== CONSTITUTION ===
$(cat $constitution_file)

=== FEATURE_SPEC ===
$(cat $spec_file)
"
    
    # This can be integrated with a real Deep Research API (such as Perplexity) in the future
    # Currently using the Fabric model for deep analysis
    set -l report (echo "$context" | fabric -p perform_deep_analysis)

    if test -z "$report"; echo "❌ AI failed."; return 1; end

    echo "$report" > "$research_file"
    echo "✅ Research Report saved to: $research_file"
    
    if type -q nvim; nvim "$research_file"; else; vim "$research_file"; end
end
