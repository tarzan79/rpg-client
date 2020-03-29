extends Node

"""
rpc('function_name', <optional_args>)
rpc_id(<peer_id>,'function_name', <optional_args>)
rpc_unreliable(function_name', <optional_args>)
rpc_unreliable_id(<peer_id>, 'function_name', <optional_args>)

rset('variable', value)
rset_id(<peer_id>, 'variable', value)
rset_unreliable('variable', value)
rset_unreliable_id(<peer_id>, 'variable', value)
"""

var _meth = []
var _meth_id = []
var _meth_unreliable = []
var _meth_unreliable_id = []

var _value = []
var _value_id = []
var _value_unreliable = []
var _value_unreliable_id = []

var i = 0

func _ready():
    pass # Replace with function body.

func _process(delta):
    i += delta
    if i > 0.2:
        i = 0
        _send()
    
func _send():
    if _meth.size() > 0:
        for i in _meth:
            i.node.rpc(i.method, i.val)
        _meth.clear()
    if _meth_id.size() > 0:        
        for i in _meth_id:
            i.node.rpc_id(i.id, i.method, i.val)
        _meth_id.clear()
    if _meth_unreliable.size() > 0:        
        for i in _meth_unreliable:
            i.node.rpc_unreliable(i.method, i.val)
        _meth_unreliable.clear()
    if _meth_unreliable_id.size() > 0:        
        for i in _meth_unreliable_id:
            i.node.rpc_unreliable_id(i.id, i.method, i.val)
        _meth_unreliable_id.clear()
            
    if _value.size() > 0:
        for i in _value:
            print(i)
            i.node.rset(i.method, i.val)
        _value.clear()
    if _value_id.size() > 0:
        for i in _value_id:
            i.node.rset_id(i.id, i.method, i.val)
        _value_id.clear()
    if _value_unreliable.size() > 0:
        for i in _value_unreliable:
            i.node.rset_unreliable(i.method, i.val)
        _value_unreliable.clear()
    if _value_unreliable_id.size() > 0:
        for i in _value_unreliable_id:
            i.node.rset_unreliable_id(i.id, i.method, i.val)
        _value_unreliable_id.clear()
        
func meth(node, method, val):
    var data = {
        "node": node,
        "method": method,
        "val": val
       }
    if not _meth.has(data):
        _meth.append(data)
    
func meth_id(node, id, method, val):
    var data = {
        "node": node,
        "id": id,
        "method": method,
        "val": val
       }
    if not _meth_id.has(data):
        _meth_id.append(data)
    
func meth_unreliable(node, method, val):
    var data = {
        "node": node,
        "method": method,
        "val": val
       }
    if not _meth_unreliable.has(data):
        _meth_unreliable.append(data)
    
func meth_unreliable_id(node, id, method, val):
    var data = {
        "node": node,
        "id": id,
        "method": method,
        "val": val
       }
    if not _meth_unreliable_id.has(data):
        _meth_unreliable_id.append(data)
    
func value(node, method, val):
    var data = {
        "node": node,
        "method": method,
        "val": val
       }
    if not _value.has(data):
        _value.append(data)
    
func value_id(node, id, method, val):
    var data = {
        "node": node,
        "id": id,
        "method": method,
        "val": val
       }
    if not _value_id.has(data):
        _value_id.append(data)
    
func value_unreliable(node, method, val):
    var data = {
        "node": node,
        "method": method,
        "val": val
       }
    if not _value_unreliable.has(data):
        _value_unreliable.append(data)
    
func value_unreliable_id(node, id, method, val):
    var data = {
        "node": node,
        "id": id,
        "method": method,
        "val": val
       }
    if not _value_unreliable_id.has(data):
        _value_unreliable_id.append(data)
