function spec_dispatch --description "Dispatch tasks based on Roadmap dependencies"
    # 1. 讀取 Roadmap
    set -l roadmap_content (cat roadmap.md)

    # 2. 叫 AI 分析當前可以執行的任務 (Find Unblocked Tasks)
    # 這裡用一個專門的 pattern: analyze_roadmap_state
    echo "🧠 Orchestrator is analyzing dependencies..."
    
    set -l actionable_specs (echo "$roadmap_content" | fabric -p analyze_roadmap_state --json)
    
    # 輸出範例 JSON: 
    # [
    #   {"spec": "specs/be-01.md", "type": "backend", "status": "pending"},
    #   {"spec": "specs/fe-01.md", "type": "frontend", "status": "pending"}
    # ]

    # 3. 平行派工 (Parallel Execution)
    for task in (echo $actionable_specs | jq -c '.[]')
        set -l spec_file (echo $task | jq -r '.spec')
        
        echo "🚀 Dispatching Agent for $spec_file..."
        
        # 這裡看你要怎麼串接實作 Agent (例如呼叫 Cline CLI 或開一個 tmux pane)
        # 這裡的概念是：同時啟動！
        # agent_run $spec_file & 
    end

    echo "✅ All agents dispatched. Check back for Pull Requests."
end
