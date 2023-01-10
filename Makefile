
default:
	@echo 'type `make <target>` where <target> is either ide, replay or doc'

ide:
	why3 ide convex_hull.mlw

replay:
	why3 replay convex_hull

doc:
	why3 doc convex_hull.mlw
	why3 session html convex_hull
