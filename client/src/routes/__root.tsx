import { createRootRoute, Outlet } from "@tanstack/react-router";
import { TanStackRouterDevtools } from "@tanstack/react-router-devtools";

const RootLayout = () => (
	<>
		<Outlet />
		<TanStackRouterDevtools initialIsOpen={false} />
	</>
);

export const Route = createRootRoute({ component: RootLayout });
