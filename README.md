# Lifetime
Lifetime is a simple module that allows you to create Lifetimes.

## Documentation
### Lifetime
A Lifetime is an object that allows you to have a `Lifespan` (say, 10 seconds). Lifetimes can be `:Revive()`ed to begin aging. Once a Lifetime's `Age` reaches its `Lifespan`, it will die, firing the `Died` event. Lifetimes can then be `:Revive()`ed after death, or `:Revive()`ed during its life to reset the age.

#### Constructors
##### Lifetime.new()
Creates a new Lifetime. The Lifetime's life will not begin, as the `Age` and `Lifespan` is automatically set to 0. `Dead` is also set to true when constructed.

#### Properties
##### Lifetime.Dead: boolean
True when the Lifetime has died (`Age` >= `Lifespan`).

##### Lifetime.Lifespan: number
The maximum amount of seconds a Lifetime can live before dying. Can be changed at any moment.

##### Lifetime.Age: number
> [!NOTE]
> This property can be changed during the Lifetime's life. This isn't really reccommened, as there aren't any real uses for using it.
> `Lifetime.Age = 0` should not be done, rather, use the `Lifetime:Revive()` method.

The age, in seconds, that the Lifetime has lived. Will always be less than or equal to `Lifespan`.

#### Methods
##### Lifetime:Revive()
Resets the `Age` of a Lifetime and fires the `Revived` event. Use after configuring the properties of a Lifetime or when you wish to reset it.

##### Lifetime:Kill()
Sets the `Age` of a Lifetime to its `Lifespan`.

##### Lifetime:Destroy()
Stop the Lifetime from operating. Only use this when you are done with a Lifetime.

#### Events
##### Lifetime.Revived
Fired when the Lifetime is revived using `Lifetime:Revive()`

##### Lifetime.Died
Fired when the Lifetime dies (`Age` >= `Lifespan`)
