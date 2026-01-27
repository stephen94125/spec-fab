function spec_evolve --description "Analyze Roadmap changes and auto-generate Specs/Plans"
    # 1. 檢查 Roadmap 有沒有還沒 Commit 的修改
    if not git diff --quiet roadmap.md
        echo "🕵️  Detecting changes in Roadmap..."
        
        set -l diff_content (git diff roadmap.md)
        set -l full_content (cat roadmap.md)

        # 2. 叫 AI 分析這波操作是要幹嘛
        echo "🧠 Analyzing impact (The Butterfly Effect)..."
        set -l actions_json (echo -e "DIFF:\n$diff_content\n\nFULL_ROADMAP:\n$full_content" | fabric -p analyze_roadmap_delta --json)

        # 3. 解析 JSON 並執行動作 (這裡用 jq 來處理 JSON，假設你有裝)
        # 為了簡化 demo，我們用文字邏輯示意：
        
        echo "⚡ Triggering Chain Reaction:"
        echo "$actions_json" | jq -c '.[]' | while read -l item
            set -l action (echo $item | jq -r '.action')
            set -l feature (echo $item | jq -r '.feature_name')
            set -l context (echo $item | jq -r '.context')
            
            # 自動化命名
            set -l filename "doc/features/"(string lower (string replace -a " " "-" $feature))"/spec.md"
            mkdir -p (dirname $filename)

            switch $action
                case "CREATE_SPEC"
                    echo "   ✨ Auto-generating Spec for: $feature..."
                    # 這裡直接呼叫你的 spec_define 邏輯
                    # 這裡把 Roadmap 的 context 餵給 spec_define
                    echo "FEATURE: $feature\nCONTEXT: $context" | fabric -p create_spec > $filename
                    echo "      -> Created: $filename"

                case "UPDATE_SPEC"
                    echo "   🔄 Updating Spec for: $feature..."
                    # 這裡比較進階，可能要 diff 舊 spec，但先簡單覆蓋或標記
                    echo "TODO: Review updates for $feature based on: $context" >> $filename
            end
        end
        
        echo ""
        echo "🎉 Evolution Complete!" 
        echo "👉 Review the generated files, then commit."
        
    else
        echo "😴 No changes in roadmap.md. Nothing to evolve."
    end
end
