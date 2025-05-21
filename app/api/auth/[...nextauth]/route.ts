import NextAuth, { NextAuthOptions } from 'next-auth';
import GoogleProvider from 'next-auth/providers/google';

const handler = NextAuth({
    secret: process.env.NEXTAUTH_SECRET,
    providers: [
        GoogleProvider({
            clientId: process.env.GOOGLE_CLIENT_ID ?? '',
            clientSecret: process.env.GOOGLE_CLIENT_SECRET ?? '',
        }),
    ],
    callbacks: {
        signIn: async ({ user, account, profile }) => {
            if (
                account?.provider === 'google' &&
                // (profile as any).verified_email === true &&
                profile?.email?.endsWith('@suntech.jp')
            ) {
                return Promise.resolve(true)
            }
            return Promise.resolve(false);
        },
    },
});

export { handler as GET, handler as POST };
