# godot-emit-signal-other-nodes

**"Emitting a signal from a different node" - Godot Engine Discord User Question**  

This is a minimal example/demo project for Godot Engine (4.x) showing how to use custom signals: having many child nodes emit a signal defined in a parent node/grid, and having a separate listener node catch and react to that signal.  

##  Purpose

- Demonstrate how to emit a custom signal from a node (e.g. a “Hex”) that doesn’t own the signal, but has a reference to a parent "grid" node.  
- Show how other parts of your game (e.g. grid-controller or logic node) can reliably connect to that signal.  
- Serve as a simple template for people asking how to implement cross-node signalling in Godot, especially when nodes are instantiated dynamically.  

## 📂 Project Structure

```
/ (root)
 ├── project.godot
 ├── scenes/
 │     ├── hex.tscn       — scene for individual hex node  
 │     ├── hex_grid.tscn   — scene for the grid container  
 │     └── main.tscn      — top-level scene (HexGrid + Logic node)  
 ├── scripts/
 │     ├── hex.gd         — script for Hex nodes  
 │     ├── hex_grid.gd    — script for HexGrid (declares signal)  
 │     └── grid_logic.gd        — “GridLogic” / listener script  
 ├── README.md           — this file  
 ├── LICENSE             — MIT License  
 └── .gitignore, .editorconfig, etc.
```

##  How It Works

1. The grid node (`HexGrid`) defines a signal, e.g. `hex_clicked`.  
2. When a “Hex” node is instantiated, it receives a reference to its parent `HexGrid`.  
3. On a certain event (e.g. mouse click or input action), the Hex node calls:  
   ```gdscript
   grid.hex_clicked.emit()
   ```  
4. A listener node (e.g. `GridLogic`) connects to `grid.hex_clicked` - using a deferred connect in `_ready()` to avoid race conditions on instantiation and signal emission.  
5. When the signal is emitted, the listener’s callback fires.  

This pattern allows decoupled communication: hex tiles don’t need to know anything about the listener, only about their grid.  

##  Setup & Usage

1. Clone or download this repository.  
2. Open the folder in Godot 4.x (just open `project.godot`).  
3. Verify that the scenes and scripts are intact.  
4. Run the main scene (e.g. `Main.tscn`).  
5. Interact (e.g. click on Hex nodes) — you’ll see console output confirming the signal is emitted and received.  

> ✅ Because the repository includes all scenes, scripts, and `project.godot`, it should “just work” for anyone - no missing dependencies or external assets.  

##  Why this method matters  

Using signals in Godot - especially when instancing nodes dynamically - requires careful attention to when you connect listeners vs. when signals are emitted. If a signal is emitted before any listener is connected, it’s lost. This example uses a deferred connect (or ensures proper scene-tree order) to avoid that problem.  


## 📝 License  

This project is released under the [MIT License](LICENSE).  

