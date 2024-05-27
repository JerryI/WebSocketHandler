With[{c = Compile[{
			{maskingKey, _Integer, 1},
			{payload, _Integer, 1}
		}, 
			(*Return: PacketArray::[MachineInteger, 1]*)
			Table[BitXor[payload[[i]], maskingKey[[Mod[i - 1, 4] + 1]]], {i, 1, Length[payload]}]
		]},
Function[{key, payload},
  c[key // Normal, payload // Normal]
]	
]