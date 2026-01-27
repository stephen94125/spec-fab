function spec_roadmap --description "Generate or Update the Product Roadmap"
    # 用法: cat brief.md | spec_roadmap
    
    set -l template_path ".specify/templates/roadmap-template.md"
    
    if not test -f $template_path
        echo "⚠️  Template not found. Initializing..." >&2
        # (這裡可以放自動建立模板的邏輯，或報錯)
    end
    
    set -l template_content (cat $template_path)
    
    # 讀取輸入 (Brief)
    read -z input_content

    echo "🗺️  Architecting your Roadmap..." >&2
    echo "   (Applying Agile Phasing & Scope Boundaries)..." >&2

    # 使用 create_roadmap pattern，並建議用 least_to_most 策略來確保分期邏輯正確
    echo -e "TEMPLATE:\n$template_content\n\nBRIEF:\n$input_content" \
    | fabric -p create_roadmap --strategy least_to_most \
    | tee roadmap.md
    
    echo "✅ Roadmap generated at 'roadmap.md'." >&2
    echo "👉 Now, you act as the Product Owner: Review the boundaries, then generate specs for Phase 1." >&2
end
