︠a2d93286-0d38-43b5-89e1-ef766ed15d97︠
razdalje = [
    [0, 2, 2, 40 * (1 / 2)],
    [2, 0, 8 ** (1 / 2), 5],
    [2, 8 ** (1 / 2), 0, 6],
    [40 * (1 / 2), 5, 6, 0]
]

K = 2
n = len(razdalje)  # število mest

p = MixedIntegerLinearProgram(maximization=False)
x = p.new_variable(binary=True)  # x_ij = 1 če mesto i spada k skladišču j (mestu j s skladiščem)
y = p.new_variable(binary=True)  # y_i = 1 če je v mestu y_i skladišče

p.set_objective(R) #vjretno bi bilo treba napisat v obliki max(min(razdalje))

for i in range(n):
    p.add_constraint(sum(x[i, j] for j in range(n)) == 1)
    # za vsako mesto i bo veljalo, da spada pod neko v obmocje mesta j s skladiscem

p.add_constraint(sum(y[i] for i in range(n)) == K)

for i in range(n):
    for j in range(n):
        p.add_constraint(x[i, j] <= y[j])
        # ne sme se zgoditi, da mesto i pade v območje mesta j, v mestu j pa sploh ni skladišča

for i in range(n):
    p.add_constraint(sum(razdalje[i][j] * x[i][j]) for j in range(n) <= R)
    # za vsako obstoječo povezavo med mestom in skladiščem mora veljati, da je ta manjša od R

p.solve()
res = p.get_values(x)
res
︡529ebdc4-48ae-4a33-b6d5-2addc15a7630︡{"stderr":"Error in lines 12-12\nTraceback (most recent call last):\n  File \"sage/numerical/mip.pyx\", line 1545, in sage.numerical.mip.MixedIntegerLinearProgram.set_objective (build/cythonized/sage/numerical/mip.c:11499)\n    f = {-1: R(obj)}\n  File \"sage/structure/parent.pyx\", line 900, in sage.structure.parent.Parent.__call__ (build/cythonized/sage/structure/parent.c:9336)\n    return mor._call_(x)\n  File \"sage/structure/coerce_maps.pyx\", line 161, in sage.structure.coerce_maps.DefaultConvertMap_unique._call_ (build/cythonized/sage/structure/coerce_maps.c:4623)\n    raise\n  File \"sage/structure/coerce_maps.pyx\", line 156, in sage.structure.coerce_maps.DefaultConvertMap_unique._call_ (build/cythonized/sage/structure/coerce_maps.c:4515)\n    return C._element_constructor(x)\n  File \"sage/rings/real_double.pyx\", line 724, in sage.rings.real_double.RealDoubleElement.__init__ (build/cythonized/sage/rings/real_double.c:9416)\n    self._value = float(x)\nTypeError: float() argument must be a string or a number, not 'type'\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\n  File \"sage/numerical/mip.pyx\", line 1548, in sage.numerical.mip.MixedIntegerLinearProgram.set_objective (build/cythonized/sage/numerical/mip.c:11547)\n    f = obj.dict()\nAttributeError: type object 'R' has no attribute 'dict'\n"}︡{"done":true}









